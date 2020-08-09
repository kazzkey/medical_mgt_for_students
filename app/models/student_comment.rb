class StudentComment < ApplicationRecord
  belongs_to :contact_student
  has_one_attached :comment_image
end
