class OfferRelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    offer = Offer.find(params[:of_cand_id])
    current_user.offer_follow(offer)
    redirect_to offer
  end

  def destroy
    offer = OfferRelationship.find(params[:id]).of_cand
    current_user.offer_unfollow(offer)
    redirect_to offer

  end
end
