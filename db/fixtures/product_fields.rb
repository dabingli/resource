fixture_file = Rails.root.join 'db', 'fixtures', 'product_fields.yml'
product_category_fields = YAML.load_file(fixture_file)

records = []
product_category_fields.each do |category_ids, fields|
  fields.each_with_index do |field, i|
    field_name, options = field
    options ||= {}
    case field_name
    # 用作占位符
    # 宽屏下一行显示三个属性，但业务人员要求某些行只显示两个属性
    when 'placeholder'
      field_name = nil
      title = nil
    # 部分分类的表单中业务要求显示一个只用于显示的优等品属性
    when '优等品'
      title = nil
    when *Product.column_names
      title = options['title'] || Product.human_attribute_name(field_name)
    else
      raise "Unknown product field: #{field_name}"
    end

    Array(category_ids).each do |category_id|
      records << {
        id: records.size + 1,
        product_category_id: category_id,
        position: i + 1,
        name: field_name,
        title: title,
        required: options['required'] || false,
      }
    end
  end
end

ProductField.seed :id, *records
ProductField.where('id > ?', records.last[:id]).delete_all
