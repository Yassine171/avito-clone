class Ville < ApplicationRecord
  has_many :annonces
  has_many :users
end
