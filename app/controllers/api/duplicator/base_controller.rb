class Api::Duplicator::BaseController < Api::BaseController

  TIME_PRECISION = 6

  # 捕获错误
  rescue_from Exception, with: :render_500
  rescue_from ActionController::BadRequest, with: :render_400
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from ActionController::ParameterMissing, with: :render_parameter_required
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

  private

  def log_exception(exception)
    Rails.logger.error "#{exception.message} (#{exception.class})\n#{(exception.backtrace || []).join("\n")}"
  end

  def render_400(exception)
    log_exception exception
    r_json 'Bad request'
  end

  def render_404(exception)
    log_exception exception
    r_json 'No found'
  end

  def render_500(exception)
    log_exception exception
    r_json 'Server error'
  end

  def render_parameter_required(exception)
    log_exception exception
    r_json "Parameter required: #{exception.param}"
  end

  def render_record_not_found(exception)
    log_exception exception
    r_json 'Not found'
  end


  # r_json err_msg
  # r_json data
  def r_json(data)
    if String === data
      render json: {
        code: 1,
        msg: data,
      }
    else
      render json: {
        code: 0,
        msg: 'OK',
        data: data,
      }
    end
  end
end
