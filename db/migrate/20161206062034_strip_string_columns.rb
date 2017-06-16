class StripStringColumns < ActiveRecord::Migration
  def up
    tables = [
      'baby_managements',
      'price_managements',
      'product_halls',
      'products',
      'skus',
      'users',
    ]

    tables.each do |table_name|
      (model = table_name.classify.constantize) rescue NameError
      next unless model
      next if model.unscoped.count == 0

      sql = "UPDATE #{table_name} SET "

      model.columns.each do |column|
        if column.type == :string || column.type == :text
          sql << "#{column.name} = regexp_replace(#{column.name}, '^\\s+|\\s+$', ''), "
        end
      end

      ActiveRecord::Base.connection.execute sql.sub(/[ ,]+$/, ';')
    end
  end

  def down
  end
end
