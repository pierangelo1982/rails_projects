class WelcomeController < ApplicationController
  
  include WelcomeHelper
    
  def home
  end

  def index
   #this function is in welcomeHelper
   @obj = getJson(params[:city])
  end

  def detail
  	city = params[:city]
  	tm = params[:time]
  	@obj = getJsonDetail(city, tm.to_i)
  end
end
