class Contact < ApplicationRecord
  belongs_to :user_student, optional: true
  belongs_to :user_officer, optional: true
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :title  , presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 65535 }
end
