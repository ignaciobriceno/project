class Category < ApplicationRecord
	 has_many :category_photographers
	 has_many :photographers, through: :category_photographers
end
