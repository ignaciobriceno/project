class Event < ApplicationRecord
	belongs_to :reservation
	accepts_nested_attributes_for :reservation
end
