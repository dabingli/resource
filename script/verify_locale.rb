# Verify whether activerecord locale is complete
# Run it with rails runner:
#   rails runner script/verify_locale.rb

LOCALE_FILEPATH = File.join(Rails.root, 'config', 'locales', 'zh-CN.yml')

def red(str)
  "\e[31m#{str}\e[0m"
end

def purple(str)
  "\e[35m#{str}\e[0m"
end

def aqua(str)
  "\e[36m#{str}\e[0m"
end

# tables in current database
db_tables = ActiveRecord::Base.connection.tables.reject do |name|
  name =~ /schema_migrations|ar_internal_metadata/
end.map(&:singularize).sort

locale = YAML.load_file(LOCALE_FILEPATH)['zh-CN']
activerecord_locale = locale['activerecord']
common_columns = locale['attributes']&.keys || []

# verify models in activerecord['models']
missing_models = db_tables - activerecord_locale['models'].keys
excessive_models = activerecord_locale['models'].keys - db_tables
empty_models = activerecord_locale['models'].select do |model, definition|
  definition.nil? || definition.empty?
end.keys - excessive_models

unless missing_models.empty?
  puts "#{purple 'Missing model definition:'} #{missing_models.join(' ')}"
end
unless excessive_models.empty?
  puts "#{purple 'Excessive model definition:'} #{excessive_models.join(' ')}"
end
unless empty_models.empty?
  puts "#{purple 'Empty model definition:'} #{empty_models.join(' ')}"
end

# verify models in activerecord['attributes']
missing_models = (db_tables - activerecord_locale['attributes'].keys).reject do |model|
  (model.classify.constantize.column_names - common_columns).blank?
end
excessive_models = activerecord_locale['attributes'].keys - db_tables
empty_models = activerecord_locale['attributes'].select do |model, definition|
  definition.blank?
end.keys - excessive_models

unless missing_models.empty?
  puts "#{purple 'Missing attributes definition for models:'} #{missing_models.join(' ')}"
end
unless excessive_models.empty?
  puts "#{purple 'Excessive attributes definition for models:'} #{excessive_models.join(' ')}"
end
unless empty_models.empty?
  puts "#{purple 'Empty attributes definition for models:'} #{empty_models.join(' ')}"
end

# verify attributes of each model
activerecord_locale['attributes'].each do |model_name, column_definitions|
  next if column_definitions.blank?
  next unless db_tables.include?(model_name)

  db_columns = model_name.classify.constantize.column_names.sort
  locale_columns = column_definitions.keys.sort

  missing_columns = db_columns - locale_columns - common_columns
  excessive_columns = locale_columns - db_columns
  empty_columns = column_definitions.select do |column, definition|
    definition.nil? || definition.empty?
  end.keys

  unless missing_columns.empty? && excessive_columns.empty? && empty_columns.empty?
    puts "#{purple 'Incorrect column definitions for:'} #{model_name}"
    unless missing_columns.empty?
      printf "%20s %s\n", purple('missing:'), missing_columns.join(' ')
    end

    unless excessive_columns.empty?
      printf "%20s %s\n", purple('excessive:'), excessive_columns.join(' ')
    end

    unless empty_columns.empty?
      printf "%20s %s\n", purple('empty:'), empty_columns.join(' ')
    end
  end
end
