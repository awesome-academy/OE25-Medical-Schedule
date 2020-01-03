class AdminsController < ApplicationController
  before_action :authenticate_user!

  layout "admins"

  def index; end
end
