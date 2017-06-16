module I18n
  def self.chinese?(locale = I18n.locale)
    locale.to_sym == :'zh-CN'
  end
end
