class Annonce < ApplicationRecord
  belongs_to :ville
  belongs_to :user
  belongs_to :category
  has_many_attached :images

  enum transaction_type: [:vente, :location]
  serialize :additional_properties, JSON
  validates :title, :description, :price, presence: true
  validate :validate_images

  MAX_IMAGES = 5
  MAX_IMAGE_SIZE = 10.megabytes

  def validate_images
    if images.attached?
      if images.length > MAX_IMAGES
        errors.add(:images, "can't be more than #{MAX_IMAGES}")
      end

      images.each do |image|
        if image.blob.byte_size > MAX_IMAGE_SIZE
          errors.add(:images, "must be less than #{MAX_IMAGE_SIZE / 1.megabyte}MB")
        end
      end
    else
      errors.add(:images, "can't be blank")
    end
  end
end
