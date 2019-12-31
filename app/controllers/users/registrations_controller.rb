class Users::RegistrationsController < Devise::RegistrationsController
  after_action :attach_image, only: %i(create update)

  def create
    super
  end

  def update
    super
  end

  private

  def attach_image
    return if resource.attach_image params, :user

    flash[:danger] = t "not_sucess"
    render :new
  end
end