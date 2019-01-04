class Borrow < ApplicationRecord
  belongs_to :user
  has_many :borrow_details, dependent: :destroy
  validates :date_borrow, presence: true
  validates :end_date_borrow, presence: true
end
