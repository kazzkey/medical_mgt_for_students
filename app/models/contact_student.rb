class ContactStudent < ApplicationRecord
  belongs_to :user_student
  has_one_attached :image

  validates :title  , presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 65535 }
end
