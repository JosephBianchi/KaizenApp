class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save { email.downcase! }

  validates :first_name,  presence: true, length: { maximum: 200 }
  validates :last_name, presence: true, length: { maximum: 200 }
  validates :age, presence: true, length: { maximum: 200 }
  validates :sex, presence: true, length: { maximum: 200 }
  validates :email, presence: true, length: { maximum: 200 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :phone, presence: true, length: { maximum: 200 }
  validates :role, presence: true, length: { maximum: 200 }
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string. ONLY PAY ATTENTION TO IF WANT TO USE FIXTURES FOR USER INSTEAD OF FACTORIES
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  has_secure_password

end
