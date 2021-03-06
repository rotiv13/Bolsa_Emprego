class Offer < ApplicationRecord
  belongs_to :user

  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :description, presence: true
  validates :title, presence: true
  validates :prof_area, presence: true
  validates :date_begin, presence: true
  validates :date_end, presence: true

  has_many :offer_passive_relationships, class_name: "OfferRelationship",
           foreign_key: "of_cand_id",
           dependent: :destroy

  has_many :offerends, through: :offer_passive_relationships, source: :cand

  scope :active, -> { where active: true}
  scope :search, -> (search) {where "title like ? ","%#{search}%"}
  scope :locality, -> (local) { where locality: local}
  scope :prof_area, -> (area) { where prof_area: area}

  def activate
    update_attribute(:active, true)
  end

  def deactivate
    update_attribute(:active, false)
  end
end
