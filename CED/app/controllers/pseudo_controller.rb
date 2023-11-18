class ApplicationError < StandardError; end

# Validation Errors
class ValidationError < ApplicationError; end
class RequiredFieldError < ValidationError; end
class UniqueFieldError < ValidationError; end

# HTTP 4XX Response Errors
class ResponseError < ApplicationError; end
class BadRequestError < ResponseError; end
class UnauthorizedError < ResponseError; end
# ...


# app/controller/pseudo_controller.rb
def authenticate_user!
    fail AuthenticationError if token_invalid? || token_expired?
    User.find_by(authentication_token: token)
  rescue AuthenticationError => e
    report_suspicious_activity if token_invalid?
    raise e
  end
  
  def show
    authenticate_user!
    show_private_stuff!(params[:id])
  rescue ClientError => e
    render_error(e)
  end