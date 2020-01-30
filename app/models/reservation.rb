class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :photographer
  has_one :event
  accepts_nested_attributes_for :event
end
