class Api::V1::BaseController < Api::BaseController
  include Api::V1::Concerns::ParamsHelper

  # 返回 ISO-8601 格式的时间，不带小数秒部分
  TIME_PRECISION = 0

  before_action :set_site
  around_action :parse_language

  # 捕获错误
  rescue_from StandardError, with: :render_error

  API_ERROR_MSGS = {
    ok: 'OK',
    bad_request: 'Bad request',
    route_not_found: 'Route not found',
    server_error: 'Server error',
    unauthorized: 'Unauthorized',
    parameter_missing: 'Missing parameter: ',
    forbidden: 'Forbidden',
    record_not_found: 'Record not found',
    wrong_parameter: "Wrong parameter: ",
    invalid_filter_value: "Invalid filter:",
  }

  API_ERROR_CODE_ALIAS = {
    ok: 0,
    bad_request: 10000,
    route_not_found: 10004,
    server_error: 20000,
    unauthorized: 30001,
    parameter_missing: 30002,
    forbidden: 30003,
    record_not_found: 30004,
    wrong_parameter: 30005,
    invalid_filter_value: 40001, # 获取产品列表时，所传的参数值不在合法的可选值中。用于通知客户端需重新获取各筛选条件的可选值
  }

  private

  def render_error(exception)
    Rails.logger.error "#{exception.message} (#{exception.class})\n#{(exception.backtrace || []).join("\n")}"
    case exception
    when ActionController::BadRequest
      r_json :bad_request
    when ActionController::RoutingError
      r_json :route_not_found
    when ActionController::ParameterMissing
      r_json :parameter_missing, "Parameter required: #{exception.param}"
    when ActiveRecord::RecordNotFound
      r_json :record_not_found
    else
      r_json :server_error
    end
  end

  # r_json code_alias, msg, data
  # r_json code_alias, msg
  # r_json code_alias, data
  def r_json(code_alias, msg = nil, data = nil)
    code = API_ERROR_CODE_ALIAS[code_alias]
    if code.nil? || !code.kind_of?(Integer)
      Rails.logger.error "Wrong code_alias passed: #{code.inspect}"
      return render json: {
        code: 20000,
        msg: 'Server error',
      }
    end

    if !msg.nil? && !msg.kind_of?(String)
      data = msg
      msg = nil
    end

    result = {
      code: code,
      msg: msg || API_ERROR_MSGS[code_alias] || 'Unexpected error',
    }

    if data
      result[:data] = data
    end

    render json: result, status: 200
  end

  # 数据库中对应语言字段的前缀名
  def locale_field_prefix(locale = I18n.locale)
    I18n.chinese?(locale) ? '' : "#{locale}_"
  end
end
