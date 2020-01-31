class CategoryPhotographersController < ApplicationController
	before_action :set_photographer

	def destroy
		relation = CategoryPhotographer.find(params[:format])
		relation.delete
		redirect_to photographers_edit_path
	end
	private
	def set_photographer
    	@photographer = current_photographer
    end
    def photographer_params
      	params.require(:photographer).permit(:name, :email, :categories)
    end
end
