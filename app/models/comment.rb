class Comment < ApplicationRecord
  belongs_to :contact
  belongs_to :user_students, optional: true
  belongs_to :user_officers, optional: true
  has_one_attached :comment_image
end
