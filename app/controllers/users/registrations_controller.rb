class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: I18n.t('devise.registrations.signed_up') }
  end

  def register_failed
    render json: { message: "Failed to register, #{resource.errors.full_messages.join(', ')}" }, status: :unauthorized
  end
end
