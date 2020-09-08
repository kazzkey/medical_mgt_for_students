class UserStudent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contacts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :checks, dependent: :destroy
  has_one_attached :profile_image

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :student_id,
            presence: true, uniqueness: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :school_id,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :birth_date, presence: true
  validates :grade, presence: true
  validates :blood_type, presence: true

  enum grade: {小学1年生:1,
               小学2年生:2,
               小学3年生:3,
               小学4年生:4,
               小学5年生:5,
               小学6年生:6,
               中学1年生:7,
               中学2年生:8,
               中学3年生:9,
               高校1年生:10,
               高校2年生:11,
               高校3年生:12
             }
   enum blood_type: {A型:0,
                    B型:1,
                    O型:2,
                    AB型:3
              }
end
