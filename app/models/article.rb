class Article < ApplicationRecord
  belongs_to :employee, optional: true

  validates :title, presence: true, length: { maximum: 50 }
end
