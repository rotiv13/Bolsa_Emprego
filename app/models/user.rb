class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token
  before_save :downcase_email
  before_create :create_activation_digest
  mount_uploader :picture, PictureUploader
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
  validate :picture_size

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


  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "tamamnho deve ser menor que 5MB")
    end
  end
end
