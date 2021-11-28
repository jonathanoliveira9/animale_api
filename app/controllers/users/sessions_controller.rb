class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    login_success && return if resource.persisted?

    login_failure
  end

  def login_success
    render json: { message: I18n.t('devise.sessions.signed_in'),
                   user: UserSerializer.new(current_user).serializable_hash }, status: :ok
  end

  def login_failure
    render json: { message: I18n.t('devise.sessions.failed_signed') }, status: :unauthorized
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    logout_out_failure
  end

  def log_out_success
    render json: { message: I18n.t('devise.sessions.signed_out') }, status: :ok
  end

  def logout_out_failure
    render json: { message: I18n('devise.sessions.failed_signed_out') }, status: :unauthorized
  end

  def nested_relationship
    options = {}
    options[:include] = [:communicators]
    options
  end
end
