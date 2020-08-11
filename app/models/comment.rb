class Comment < ApplicationRecord
  belongs_to :contact
  belongs_to :user_student, optional: true
  belongs_to :user_officer, optional: true
  has_one_attached :comment_image
end
