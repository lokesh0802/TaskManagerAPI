class User < ApplicationRecord
    has_secure_password

    has_many :tasks, dependent: :destroy
  
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }
  
    before_save :downcase_email
    before_create :generate_auth_token
  
    private

    def downcase_email
      self.email = email.downcase
    end

    def generate_auth_token
      self.auth_token = SecureRandom.hex(24)
    end
end
