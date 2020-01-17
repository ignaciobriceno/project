class AddReservationsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :reservation, foreign_key: true
  end
end
