# Find maximum scale (number of digits after the decimal point) of decimal column values in current database
# Run it with rails runner:
#   rails runner script/find_max_scale_of_decimal_columns.rb

# [[table_name, column_name, max_scale]]
max_scales = []

ActiveRecord::Base.connection.tables.each do |table|
  begin
    model = table.classify.constantize
  rescue NameError
    next
  end

  model.columns.each do |column|
    next if column.type != :decimal
    result = ActiveRecord::Base.connection.query <<-SQL
      SELECT
        MAX(CHAR_LENGTH(
          SUBSTRING(
            #{column.name}::text
            FROM '\\.(\\d*?)0*$'
          )
        )) AS max_scale
      FROM #{table};
    SQL

    max_scales << [table, column.name, result[0][0].to_i]
  end
end

printf "%20s %-15s %s\n", "Table", "Column", "Max Scale"
max_scales.sort_by {|item| item[2]}.reverse.each do |arr|
  printf "%20s %-15s %d\n", *arr
end
