class Publisher < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, presence: true,
    length: { maximum: Settings.publisher.name_maximum }
  validates :description, presence: true,
    length: { maximum: Settings.publisher.description_maximum }
  scope :alphabet, ->{order name: :ASC}
  scope :search_publisher, -> search {
    where("publishers.name LIKE ?", "%#{search.strip}%") if search.present?
  }
end
