class UserOfficer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  self.inheritance_column = :_type_disabled

  enum type: {教師:0, 医師:1}
  has_many :contacts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :memos, dependent: :destroy
end
