class ResultsController < ApplicationController
  before_action :authenticate_admin!


	def index
		@categories = Category.all
	end


end
