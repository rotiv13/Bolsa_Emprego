class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  has_many :offers, dependent: :destroy
  #Users relations
  has_many :active_relationships, class_name: "Relationship",
           foreign_key: "follower_id",
           dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
           foreign_key: "followed_id",
           dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  #User offer relation
  has_many :offer_active_relationships, class_name: "OfferRelationship",
           foreign_key: "cand_id",
           dependent: :destroy
  has_many :offer_passive_relationships, class_name: "OfferRelationship",
           foreign_key: "of_cand_id",
           dependent: :destroy
  has_many :offerings, through: :offer_active_relationships, source: :of_cand
  has_many :offerends, through: :offer_passive_relationships, source: :cand

  #Scopes
  scope :entitie, -> { where(entitie: '2')}
  scope :candidate, -> { where(entitie: '1')}
  scope :search, -> (search) {where("name like ? OR presentation like ?","#{search}%","%#{search}%")}
  scope :locality, -> (local) { where locality: local}
  scope :prof_situation, -> (situation) { where prof_situation: situation}
  scope :prof_area, -> (area) { where prof_area: area}
  scope :type, -> (type) { where entitie: type}


  before_save :downcase_email
  before_create :create_activation_digest
  mount_uploader :picture, PictureUploader
  mount_uploader :curriculum, CurriculumUploader
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true ,allow_nil: true
  validates :address, presence: true, allow_nil: true
  validates :postal_code, presence: true, length:{minimum: 4}, allow_nil: true
  validates :locality, presence: true, allow_nil: true
  validates :cellphone, presence: true , length: {is: 9}, numericality: true , allow_nil: true
  validates :phone, numericality: true, length:  {is: 9}, allow_nil: true
  validates :birth_date, presence: true, allow_nil: true
  validates :idnum, presence: true, allow_nil: true
  validates :presentation, presence: true, allow_nil: true
  validates :prof_situation, presence: true, allow_nil: true
  validate :picture_size
  validate :curriculum_size

  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
          BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def deactivate
    update_attribute(:activated, false)
    update_attribute(:activated_at, nil)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
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

  def entitie?
    current_user.entitie == '2'
  end

  #Relationships

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  #offer
  def offer_follow(offer)
    offer_active_relationships.create(of_cand_id: offer.id)
  end

  def offer_unfollow(offer)
    offer_active_relationships.find_by(of_cand_id: offer.id).destroy
  end

  def offerings?(offer)
    offerings.include?(offer)
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
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
      errors.add(:picture, "tamanho deve ser menor que 5MB")
    end
  end

  def curriculum_size
    if curriculum.size > 5.megabytes
      errors.add(:curriculum, "tamanho deve ser menor que 5MB")
    end
  end
end
