class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :events, :type, :category
  end
end
