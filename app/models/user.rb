class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :annonces
  belongs_to :ville
  # Add a phone_number attribute to the User model
  attribute :phone_number, :string

  validates :phone_number, format: { with: /\A0\d{9}\z/, message: "must start with 0 and have a total length of 10" }

end
