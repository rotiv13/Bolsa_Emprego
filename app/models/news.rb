class News < ApplicationRecord
  default_scope -> { order(destaque: :desc) }
  mount_uploader :picture, PictureUploader
  validates :title, presence: true
  validates :date, presence: true
  validates :summary, presence: true, length: {maximum: 140}
  validates :text, presence: true


  def self.search(search)
    if search
      where("title LIKE '%#{search}%'")
    else
      find(:all)
    end
  end

end
