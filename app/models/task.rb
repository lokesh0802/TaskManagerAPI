class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title ,presence: true
  validates :status, inclusion: { in: ["pending", "in_progress", "completed"] }
  after_initialize :set_default_status

  def set_default_status
    self.status ||= "pending"

  end
  
end
