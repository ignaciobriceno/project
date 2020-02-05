class CategoriesController < ApplicationController
  def index
  	@photographers = Category.find(params[:id]).photographers
  	
  end
end
