ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :name, :email, :password
  
  index do
   column :id
   column :email
   column :created_at
   column :email_provider do |user|
     user.email.split('@').last.capitalize
   end
   column :member_since do |user|
     time_ago_in_words(user.created_at)
   end
   actions
 end

 form do |f|
   inputs 'Agregar un nuevo usuario' do
     input :name
     input :email
     input :password
   end
   actions
 end

 controller do
   def update
     if (params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
     params[:user].delete("password")
     params[:user].delete("password_confirmation")
   end
   super
 end
end
end
