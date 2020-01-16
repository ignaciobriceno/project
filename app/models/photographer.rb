class Photographer < ApplicationRecord
	has_many :reservations
	has_many :events
	has_many :users, through: :reservations
	has_many :users, through: :events
end
