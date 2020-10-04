class DashboardController < ApplicationController
  def index
  end

  def magazzino
  	@products = Product.all
  	@product_category = ProductCategory.all
  	@brand = Brand.all
  end

end
