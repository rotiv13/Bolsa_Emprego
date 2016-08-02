class Offer < ApplicationRecord
  belongs_to :user

  # default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :description, presence: true
  validates :title, presence: true
  validates :date_begin, presence: true
  validates :date_end, presence: true

  scope :entitie, -> { where(entitie: '2')}
  scope :candidate, -> { where(entitie: '1')}
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
