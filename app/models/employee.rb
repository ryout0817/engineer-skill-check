class Employee < ApplicationRecord
  belongs_to :office
  belongs_to :department
  has_many :articles, dependent: :destroy
  has_many :profiles, dependent: :destroy

  validates :number, :last_name, :first_name, :account, :password, :email, :date_of_joining, presence: true

  scope :active, lambda {
    where(deleted_at: nil)
  }
end
