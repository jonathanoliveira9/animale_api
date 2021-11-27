class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    login_success && return if resource.persisted?

    login_failure
  end

  def login_success
    render json: { message: 'You are logged in', user: current_user }, status: :ok
  end

  def login_failure
    render json: { message: 'Failed to login' }, status: :unauthorized
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    logout_out_failure
  end

  def log_out_success
    render json: { message: 'You are logged out.' }, status: :ok
  end

  def logout_out_failure
    render json: { message: 'Failure to logout'}, status: :unauthorized
  end
end
