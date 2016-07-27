class OffersController < ApplicationController
  before_action :logged_in_user , only: [:edit, :destroy, :update]
  before_action :logged_in_entity

  def new
    @offer = Offer.new

  end

  def search
    if params[:prof_area]
      @offers = @offers.fields(params[:prof_area])
    end
  end

  def index
    @offers = Offer.all
    if params[:search]
      @offers=@offers.search(params[:search])
    end
    if params[:fields]
      @offers=@offers.fields(params[:fields])
    end
    @offers =  @offers.paginate(page:params[:page], per_page: 8)
  end

  def show
    @offer = Offer.find(params[:id])
    @other_offer = Offer.all.where('prof_area like ? AND id != ?', @offer.prof_area, @offer.id).limit(2)
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      flash[:success] = "Oferta Guardada com Sucesso!"
      redirect_to offers_path
    else
      render 'new'
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :date_begin, :date_end, :description,
                                  :salary, :type_contract, :prof_area, :user)
  end
end
