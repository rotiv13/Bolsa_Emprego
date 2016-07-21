class User < ApplicationRecord

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
      uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :address, presence: true
  validates :postal_code, presence: true, length:{minimum: 4}
  validates :locality, presence: true
  validates :cellphone, presence: true , length: {is: 9}, numericality: true
  validates :phone, numericality: true, length:  {is: 9}
  validates :birth_date, presence: true
  validates :idnum, presence: true
  validates :presentation, presence: true

  class << self
    #Returns the hash digest of the given string.
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
          BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end

end
