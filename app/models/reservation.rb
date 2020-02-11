class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :photographer
  has_one :event, dependent: :destroy
  accepts_nested_attributes_for :event
end
