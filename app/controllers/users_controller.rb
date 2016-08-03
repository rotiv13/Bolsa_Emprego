class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]

  def show
    @user = User.find(params[:id])
    @offers = @user.offers
    @offers_active = @offers.where(active: true).paginate(page:params[:page], per_page:2)
    @offers_limit = @offers_active.paginate(page:params[:page], per_page:2)
    @offers_deactive = @offers.where(active: false).paginate(page:params[:page], per_page:2)
    @offers_candidature = @user.offerings.paginate(page:params[:page], per_page:2)
    @followers = @user.followers.where(entitie: '2').paginate(page:params[:page], per_page:2)
  end

  def index_candidate
    @users = User.candidate
    filtering_params(params).each do |key, value|
      @users = @users.public_send(key,value) if value.present?
    end
    @users = @users.paginate(page: params[:page], per_page:8)
  end

  def index_entitie
    @users = User.entitie
    filtering_params(params).each do |key, value|
      @users = @users.public_send(key,value) if value.present?
    end
    @users = @users.paginate(page: params[:page], per_page:8)

  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Utilizador apagado!"
    redirect_to admin_user?(current_user) ? backoffice_index_url(data: 'users') : index_url
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      unless @user.activated
        @user.send_activation_email
        flash[:info] = "Por favor, verifique o seu email para activar a sua conta."
      end
      redirect_to admin_user?(current_user) ? backoffice_show_users_path(@user) : root_url
    else
      render(@user.entitie == '2' ? 'users/new_entitie' : 'users/new_candidate', :user => @user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Perfil Atualizado!"
      redirect_to admin_user?(current_user) ? backoffice_show_users_path(@user) : @user
    else
      render 'edit'
    end
  end

  def new_candidate
    @user = User.new
    store_location
  end

  def new_entitie
    @user = User.new
    store_location
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :entitie, :address, :postal_code, :locality,
                                 :phone, :cellphone, :page, :birth_date, :idnum, :prof_area, :presentation,
                                 :skill_level, :skills, :prof_situation, :prof_experience, :picture, :activated, :curriculum)
  end




  def filtering_params(params)
    params.slice(:search,:prof_area,:prof_situation,:locality)
  end
end