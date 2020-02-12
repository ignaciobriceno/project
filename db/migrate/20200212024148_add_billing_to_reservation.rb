class AddBillingToReservation < ActiveRecord::Migration[5.2]
  def change
    add_reference :reservations, :billing, foreign_key: true
  end
end
