class CategoryPhotographersController < ApplicationController
	before_action :set_photographer,:set_relations

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
  
end