# DateTime 序列化为 JSON 时的时间精度
# 为 ActiveSupport::JSON::Encoding.time_precision 增加线程级别设置的支持
# 便于不同 API 使用不同的精度
module ActiveSupport::JSON::Encoding
  class << self
    def time_precision
      Thread.current[:time_precision] || @time_precision
    end
  end
end
