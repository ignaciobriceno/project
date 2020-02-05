class CategoryPhotographersController < ApplicationController
	before_action :set_photographer,:set_relations, #:relation_params# :photographer_params

	def destroy
		relation = CategoryPhotographer.where(category_id: params[:format])
		relation[0].delete
		redirect_to photographers_edit_path
	end
	private
	def set_photographer
    	@photographer = current_photographer
    end
    def set_relations
    	@relations = CategoryPhotographer.all
    end
    def relation_params
    	params.require(:categoryphotographer).permit(:categoryphotographer_id)
	end
end