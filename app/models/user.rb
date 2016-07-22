class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true ,allow_nil: true
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

    def new_token
      SecureRandom.urlsafe_base64
    end

    def search(search)
      if search
        where("name LIKE '%#{search}%'")
      else
        find(:all)
      end
    end
    def filter(filter)
      if filter
        find(:all,:conditions => ['prof_area LIKE ?','#{filter}'])
      else
        find(:all)
      end
    end
    def local(local)
      if local
        find(:all, :conditions => ['locality LIKE ?','#{local}'])
      else
        find(:all)
      end
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
