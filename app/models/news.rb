class News < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  validates :date, presence: true
  validates :summary, presence: true, length: {maximum: 140}
  validates :text, presence: true
end
