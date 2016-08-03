class OfferRelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    offer = Offer.find(params[:of_cand_id])
    current_user.offer_follow(offer)
    respond_to do |format|
      format.html { redirect_to @offer }
      format.js
    end
  end

  def destroy
    offer = OfferRelationship.find(params[:id]).of_cand
    current_user.offer_unfollow(offer)
    respond_to do |format|
      format.html { redirect_to @offer }
      format.js
    end

  end
end
