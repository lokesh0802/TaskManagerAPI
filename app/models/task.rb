class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title ,presence: true
  validates :status, inclusion: { in: ["pending", "in_progress", "completed"] }
  #What does inclusion do?
  # It checks if the attribute's value exists within the given list (in: [...]).
   
  # If the value is not in the list, it adds a validation error.
  after_initialize :set_default_status

  def set_default_status
    self.status ||= "pending"
    #self.status = self.status || "pending"

  end
  
end
