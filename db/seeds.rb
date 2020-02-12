# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Category.create(name: 'Matrimonio')
Category.create(name: 'Cumpleaños')
Category.create(name: 'Deportes')
Category.create(name: 'Productos')
Category.create(name: 'Booking')

10.times do |i|
	User.create(name: "User #{i}", email: "user#{i}@mail.com", password: "12345678")
	Photographer.create(name: "Photographer #{i}", email: "photographer#{i}@mail.com", password: "12345678")
end
