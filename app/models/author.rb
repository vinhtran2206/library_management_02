class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :follows, dependent: :destroy
  validates :name, presence: true,
    length: { maximum: Settings.author.name_maximum }
  scope :alphabet, ->{order name: :ASC}
  scope :search_author, -> search {
    where("authors.name LIKE ?", "%#{search.strip}%") if search.present?
  }
end
