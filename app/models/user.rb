class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
  validates :name, presence: true, length: {minimum: 3, maximum: 10 }
  validates :lastname, presence: true, length: {minimum: 3, maximum: 10 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :dob, :gender, presence: true
  has_secure_password
  validates :password, length: { minimum: 6, maximum: 18}
end
