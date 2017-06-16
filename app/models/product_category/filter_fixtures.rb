class ProductCategory
  # 各分类的可用筛选条件
  filter_fixtures = YAML.load_file(Rails.root.join('config', 'category_filters.yml'))

  filter_fixtures.keys.each do |product_category_ids|
    next if product_category_ids == 'titles'

    filters = filter_fixtures[product_category_ids]
    filters.each do |field_name, options|
      options ||= {}
      I18n.available_locales.each do |locale|
        options["#{locale_field_prefix(locale)}title"] ||=
          filter_fixtures['titles'][field_name]&.[]("#{locale_field_prefix(locale)}title") ||
          Product.human_attribute_name(field_name, locale: locale)
      end
      filters[field_name] = options
    end

    if product_category_ids.is_a?(Array)
      filter_fixtures.delete product_category_ids
      product_category_ids.each do |id|
        filter_fixtures[id] = filters
      end
    else
      filter_fixtures[product_category_ids] = filters
    end
  end

  # {
  #   product_category_id: {
  #     title: '',
  #     en_title: '',
  #   }
  # }
  FILTER_FIXTURES = filter_fixtures.freeze
end
