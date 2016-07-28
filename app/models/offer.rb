class Offer < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :asc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :description, presence: true
  validates :title, presence: true
  validates :date_begin, presence: true
  validates :date_end, presence: true

  def self.search(search)
    where("title like '%#{search}%'")
  end

  def activate
    update_attribute(:active, true)
  end

  def make_active(id)
    activate
  end

  def deactivate
    update_attribute(:active, false)
  end
end
