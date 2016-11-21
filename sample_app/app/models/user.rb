class User < ApplicationRecord

  self.before_save { self.email = email.downcase }

  #  validates :name,  presence: true, length: { maximum: 50 }
  self.validates(:name, :presence => true, :length => { :maximum => 50 } )

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  self.validates :email,
    presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

  self.has_secure_password
  self.validates :password, presence: true, length: { minimum: 6 }

end