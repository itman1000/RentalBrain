class HomeController < ApplicationController
  def top
    session[:user_id] = nil
  end

  def about
  end
end
