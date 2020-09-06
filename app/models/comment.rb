class Comment < ApplicationRecord
  belongs_to :contact
  belongs_to :user_student, optional: true
  belongs_to :user_officer, optional: true
  has_one_attached :comment_image

  validates :content, presence: true, length: { maximum: 65535 }
end
