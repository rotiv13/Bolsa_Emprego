class News < ApplicationRecord
  default_scope -> { order(destaque: :desc) }
  mount_uploader :picture, PictureUploader
  validates :title, presence: true
  validates :summary, presence: true, length: {maximum: 140}
  validates :text, presence: true

  scope :title, -> (search) { where('title like ?', "#{search}%")}

  def activate
    update_attribute(:active, true)
  end

  def deactivate
    update_attribute(:active, false)
  end

  def destaques
    update_attribute(:destaque, true)
  end

  def not_destaque
    update_attribute(:destaque, false)
  end
end
