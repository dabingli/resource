# 检查模型中的关联是否正确
# 暂不能处理 polymorphic 关联

tables = ActiveRecord::Base.connection.tables.reject do |table|
  table =~ /schema_migrations|ar_internal_metadata/
end

$error_models = []
def output_error(model, msg)
  unless $error_models.include?(model)
    $error_models << model
    puts "#{model.name}:"
  end
  puts msg
end

tables.each do |table_name|
  begin
    model = table_name.classify.constantize
  rescue NameError
    puts "Warning! #{table_name} does not have corresponding model"
    next
  end

  model.reflect_on_all_associations.each do |association|
    msg = "\e[36m    #{association.name}:\e[0m"

    # 缺少 throuth 关联时，association.klass 会抛出 NoMethodError，因此提前检测 through
    if association.options[:through] && !association.through_reflection
      output_error model, "#{msg} missing through association #{association.options[:through]}"
      next
    end

    begin
      association.klass
    rescue NameError
      output_error model, "#{msg} missing associated model #{association.class_name}"
      next
    end

    case association.macro
    when :belongs_to
      primary_key = association.association_primary_key.to_s
      foreign_key = association.foreign_key.to_s

      unless association.klass.column_names.include?(primary_key)
        output_error model, "#{msg} missing primary_key #{primary_key}"
      end
      unless model.column_names.include?(foreign_key)
        output_error model, "#{msg} missing foreign_key #{foreign_key}"
      end
    when :has_many, :has_one
      next if association.options[:through]
      primary_key = association.association_primary_key.to_s
      foreign_key = association.foreign_key.to_s

      unless model.column_names.include?(primary_key)
        output_error model, "#{msg} missing primary_key #{primary_key}"
      end
      unless association.klass.column_names.include?(foreign_key)
        output_error model, "#{msg} missing foreign_key #{foreign_key}"
      end
    when :has_and_belongs_to_many
      # 暂不检查 join_table 中的字段
      unless tables.include? association.join_table
        output_error model, "#{msg} missing join_table #{association.join_table}"
      end
    else
      raise 'Unknown association type'
    end
  end
end
