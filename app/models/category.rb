class Category < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, presence: true,
    length: { maximum: Settings.Category.name_maximum }
  scope :alphabet, ->{order name: :ASC}
  scope :search_categories, -> search {
    where("categories.name LIKE ?", "%#{search.strip}%") if search.present?
  }
end
