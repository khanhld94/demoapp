class HomeController < ApplicationController
  def home
  	render "home/home", :layout => false
  end
end
