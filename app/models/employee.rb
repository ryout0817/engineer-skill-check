class Employee < ApplicationRecord
  belongs_to :office
  belongs_to :department
  has_many :articles, dependent: :destroy
  has_many :profiles, dependent: :destroy

  validates :number, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :account, presence: true
  validates :password, presence: true
  validates :email, presence: true
  validates :date_of_joining, presence: true

  scope :active, lambda {
    where(deleted_at: nil)
  }
end
