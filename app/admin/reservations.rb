ActiveAdmin.register Reservation do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :payed, :user_id, :photographer_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:payed, :user_id, :photographer_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :photographer_id, :user_id, :payed

  index do
   column :id
   column :payed
   column :user
   column :photographer
   actions
 end
  
end
