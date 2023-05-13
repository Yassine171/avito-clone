class Category < ApplicationRecord
  has_many :annonces , dependent: :destroy
end
