class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.locale_field_prefix(locale = I18n.locale)
    I18n.chinese?(locale) ? '' : "#{locale}_"
  end

  def locale_field_prefix(locale = I18n.locale)
    I18n.chinese?(locale) ? '' : "#{locale}_"
  end

  before_validation :strip_string_columns

  # string 类型的列保存前 strip 一下（去除开头和结尾的空格）
  def strip_string_columns
    skiped_strip_columns = self.class.instance_variable_get('@__skiped_strip_columns')
    return if skiped_strip_columns == true

    # 未调用 skip_strip_columns 时，@__skiped_strip_columns 会是 nil
    skiped_strip_columns ||= []

    self.class.columns.each do |column|
      if column.type == :string || column.type == :text
        next if skiped_strip_columns.include?(column.name)
        self[column.name] = self[column.name]&.strip
      end
    end
  end

  # 跳过 strip 某些列
  # 若未传参数，则所有列都不 strip
  def self.skip_strip_columns(*columns)
    self.instance_variable_set('@__skiped_strip_columns', columns.blank? ? true : columns.map(&:to_s))
  end
end
