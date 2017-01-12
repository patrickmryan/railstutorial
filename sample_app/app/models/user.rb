class User < ApplicationRecord

  attr_accessor :remember_token
  
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
    
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64()
  end
  
  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token=(User.new_token())
    self.update_attribute(:remember_digest, User.digest(self.remember_token()))
  end 

  # Returns true if the given token matches the digest.
  def authenticated?(token)
    if remember_digest.nil?
      return false
    else
      return BCrypt::Password.new(remember_digest).is_password?(token)
    end
  end
  
  # Forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end
  
end
