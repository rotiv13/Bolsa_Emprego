class OfferRelationship < ApplicationRecord
  belongs_to :cand, class_name: "User"
  belongs_to :of_cand, class_name: "Offer"
  validates :cand_id, presence: true
  validates :of_cand_id, presence: true
end
