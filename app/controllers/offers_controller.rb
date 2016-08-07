class OffersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :destroy, :create, :update, :deactivate, :activate]
  before_action :correct_offer_user, only: [:edit, :update, :deactivate, :activate]

  def new
    @offer = Offer.new
    @user = current_user
  end
  def index
    @offers = Offer.active.order(created_at: :desc)
    filtering_params(params).each do |key, value|
      @offers = @offers.public_send(key,value) if value.present?
    end
    @offers =  @offers.paginate(page:params[:page], per_page: 8)
  end

  def show
    @offer = Offer.find(params[:id])
    @other_offer = Offer.all.where('prof_area like ? AND id != ?', @offer.prof_area, @offer.id).limit(2)
    @offer_cand = @offer.offerends.limit(2)
  end

  def edit
    @offer = Offer.find(params[:id])
    @user ||= @offer.user
  end

  def create
    @user = current_user
    @offer = @user.offers.build(offer_params)
    if @offer.save
      flash[:success] = "Oferta guardada com Sucesso!"
      redirect_to offers_path
    else
      render 'new'
    end
  end

  def update
    @offer = Offer.find(params[:id])
    @user = @offer.user
    @offer = @user.offers.find(params[:id])
    if @offer.update_attributes(offer_params)
      flash[:success] = "Oferta atualizada!"
      redirect_to @offer
    else
      render 'edit'
    end
  end

  def deactivate
    @offer = Offer.find(params[:id])
    @user = @offer.user
    @offer.deactivate
    redirect_to user_path(@user, data: 'profile')
  end

  def activate
    @offer = Offer.find(params[:id])
    @user = @offer.user
    @offer.activate
    redirect_to user_path(@user, data: 'profile')

  end

  def destroy
    current_user.offers.find(params[:id]).destroy
    flash[:success] = "Oferta Cancelada!"
    redirect_to current_user
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :date_begin, :date_end, :description,
                                  :salary, :type_contract, :prof_area, :active, :picture )
  end

  def filtering_params(params)
    params.slice(:search,:locality,:prof_area)
  end

  def correct_offer_user
    @offer = Offer.find(params[:id])
    redirect_to(root_url) unless current_user?(@offer.user) || admin_user?(current_user)
  end
end
