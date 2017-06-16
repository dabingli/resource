class Search < RailsSimpleSearch::Base
  DEFAULT_OPTIONS = {
    or_separator: '|',
    exact_match: [
      'level',       # 等级
      'skus.level',
      'spec',        # 产品规格
      'products.spec',
    ],
  }

  def initialize(model, criteria, options = {})
    criteria = (criteria || {}).stringify_keys
    options = DEFAULT_OPTIONS.merge(options)

    criteria.transform_values! do |value|
      value.respond_to?(:strip) ? value.strip : value
    end

    # 按 sku 搜索时，拆分出 level
    key = criteria.keys.grep(/product_no/).first
    if key && criteria[key] =~ /(.*)-(A|B|C|D)$/
      criteria[key] = $1
      level = $2
      if key =~ /([^|]*)product.product_no/
        criteria["#{$1}level"] = level
      end
    end

    super(model, criteria, options)
  end
end
