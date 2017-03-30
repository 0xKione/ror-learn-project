class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
  VALID_PASSWORD_REGEX = /\A(?=.*[0-9])(?=.*[a-z])(?=.*[!@#$%^&_\-])([a-zA-Z0-9!@#$%^&_\-]+)\z/i
  validates :password, presence: true, length: { minimum: 6 },
                      format: { with: VALID_PASSWORD_REGEX }
end
