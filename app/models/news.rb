class News < ApplicationRecord
  default_scope -> { order(destaque: :desc) }
  mount_uploader :picture, PictureUploader
  validates :title, presence: true
  validates :date, presence: true
  validates :summary, presence: true, length: {maximum: 140}
  validates :text, presence: true

class << self
  def search(search)
    puts 'OLA model'
    self.where("title LIKE '#{search}%'")
  end

end

end
