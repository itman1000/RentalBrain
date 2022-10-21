class HomeController < ApplicationController
  def top
    session[:user_id] = nil
    @current_user = nil
  end
end
