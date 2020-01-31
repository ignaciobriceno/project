class PhotographersController < ApplicationController
	before_action :authenticate_photographer!, :set_photographer, only: [:show, :edit, :update]

	def show
	end

	def edit
		@categories = Category.all
	end

	def update
		@photographer.categories << Category.find(params[:photographer][:category_id])
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_photographer
    	@photographer = current_photographer
    end

    def photographer_params
      	params.require(:photographer).permit(:name, :email, :categories)
    end

end
