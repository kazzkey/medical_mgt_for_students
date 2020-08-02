class ContactOfficer < ApplicationRecord
  belongs_to :user_officer
  has_one_attached :image
end
