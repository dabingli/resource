class Api::BaseController < ActionController::Base
  around_action :set_time_precision

  # JSON API 中返回的时间精度（小数点后的位数）
  def set_time_precision
    orginal_value = Thread.current[:time_precision]
    Thread.current[:time_precision] = self.class.const_get('TIME_PRECISION')
    begin
      yield
    ensure
      Thread.current[:time_precision] = orginal_value
    end
  end

end
