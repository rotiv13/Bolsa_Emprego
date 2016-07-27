class Offer < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :description, presence: true, length: {minimum: 140}

  def self.search(search)
    where("title like '%#{search}%'", )
  end

  def self.fields(field)
    where("prof_area like '#{field}'")
  end
end
