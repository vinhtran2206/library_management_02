class BorrowDetail < ApplicationRecord
  belongs_to :borrow
  belongs_to :book

  validates :number, presence: true,
    numericality: {only_integer: true, greater_than: 0}

  scope :load_borrow_details, ->(id){where(borrow_id: id)}
end
