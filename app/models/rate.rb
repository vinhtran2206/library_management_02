class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :rate_level, presence: true, numericality: { only_integer: true }
end
