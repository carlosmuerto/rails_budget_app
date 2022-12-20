class SplashController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :check_signed_in

  def check_signed_in
    puts '------------ if signed_in? ----------- ' if signed_in?
    redirect_to users_path if signed_in?
  end

  def index; end
end
