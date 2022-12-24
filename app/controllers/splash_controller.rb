class SplashController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :check_signed_in

  def check_signed_in
    redirect_to groups_path if signed_in?
  end

  def index; end
end
