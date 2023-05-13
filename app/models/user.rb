class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
  has_many :annonces , dependent: :destroy
  belongs_to :ville
  has_many :favorites
  has_many :favorited_annonces, through: :favorites, source: :annonce

  # Add a phone_number attribute to the User model
  attribute :phone_number, :string
  attribute :name, :string
  validates :name, presence: true
  has_one_attached :avatar , dependent: :destroy
  validates :phone_number, format: { with: /\A0\d{9}\z/, message: "must start with 0 and have a total length of 10" }

end
