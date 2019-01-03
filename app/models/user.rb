class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :borrows, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :follows, dependent: :destroy
  validates :full_name, presence: true, length: { maximum: Settings.user.name_maximum }
  validates :gender, presence: true
  validates :address, presence: true, length: { maximum: Settings.user.address_maximum }
  validates :phone_number, presence: true, length: { maximum: Settings.user.phone_maximum }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: Settings.user.email_maximum },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: Settings.user.pass_minimum }
end
