class HomeController < ApplicationController
  def index
    @products = Home.user_data(current_user.id) if current_user.present?
  end
end
