class Pic < ApplicationRecord
  validate :acceptable_image
  belongs_to :user
  has_one_attached :avatar

  def acceptable_image
    return unless avatar.attached?

    unless avatar.byte_size <= 3.megabyte
      errors.add(:avatar, "is too big")
    end

    acceptable_types = ["image/jpeg","image/jpg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar, "must be a JPEG or PNG")
    end
  end

end
