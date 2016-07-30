class Offer < ApplicationRecord
  belongs_to :user

  has_many :offer_active_relationships, class_name: "OfferRelationship",
           foreign_key: "user_fer_id",
           dependent: :destroy

  has_many :offer_passive_relationships, class_name: "OfferRelationship",
           foreign_key: "offer_fed_id",
           dependent: :destroy

  has_many :offer_following, through: :offer_active_relationships, source: :offer_fed
  has_many :offer_followers, through: :offer_passive_relationships, source: :user_fer

  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :description, presence: true
  validates :title, presence: true
  validates :date_begin, presence: true
  validates :date_end, presence: true

  class << self
    def search(search)
      where("title like '#{search}%'")
    end

    def fields(field)
      where("prof_area like '#{field}'")
    end
  end


  def activate
    update_attribute(:active, true)
  end

  def deactivate
    update_attribute(:active, false)
  end
end
