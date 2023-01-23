class Article < ApplicationRecord
  belongs_to :employee, optional: true

  validates :title, presence: true, length: { maximum: 50 }

  acts_as_paranoid

  scope :latest, -> { order(created_at: :desc) }
  scope :old, -> { order(created_at: :asc) }

  def delete!
    self.deleted_at = Time.zone.now
    save!
  end
end
