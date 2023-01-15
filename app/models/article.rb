class Article < ApplicationRecord
  belongs_to :employee, optional: true

  validates :title, presence: true, length: { maximum: 50 }

  acts_as_paranoid

  def delete!
    self.deleted_at = Time.now
    save!
  end
end
