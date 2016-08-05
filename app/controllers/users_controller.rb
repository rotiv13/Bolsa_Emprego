class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy,:edit_user,:edit_password]
  before_action :correct_user, only: [:edit, :update, :edit_user,:edit_password]
  before_action :admin_user, only: [:destroy]

  def show
    @user = User.find(params[:id])
    @offers = @user.offers.order(created_at: :desc)
    @offers_active = @offers.active.paginate(page:params[:page], per_page:2)
    @offers_deactive = @offers.where(active: false).paginate(page:params[:page], per_page:2)
    @offers_candidature = @user.offerings.active.paginate(page:params[:page], per_page:2)
    @followers = @user.followers.entitie.paginate(page:params[:page], per_page:2)
  end

  def index_candidate
    @users = User.candidate.order(created_at: :desc)
    filtering_params(params).each do |key, value|
      @users = @users.public_send(key,value) if value.present?
    end
    @users = @users.paginate(page: params[:page], per_page:8)
  end

  def index_entitie
    @users = User.entitie.order(created_at: :desc)
    filtering_params(params).each do |key, value|
      @users = @users.public_send(key,value) if value.present?
    end
    @users = @users.paginate(page: params[:page], per_page:8)

  end

  def edit
    @user = User.find(params[:id])
  end

  def edit_password
    @user = User.find(params[:id])
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Utilizador apagado!"
    redirect_to backoffice_users_path
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
      if admin_user?(current_user)
        render 'backoffice/new'
      else
        render(@user.entitie == '2' ? 'users/new_entitie' : 'users/new_candidate', :user => @user)
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:current_password].present? #check if it is a password update by seeing if current_password is there
      current_password = params[:user].delete(:current_password)
      user = @user.authenticate(current_password)
      puts "#{current_password}"
      if @user && user #check if the @user exists and authentication by current_password was successfull
        if params[:user][:password] == params[:user][:password_confirmation]
          user.update_attribute(:password, params[:user][:password])
          flash[:success] = "Password Atualizada!"
          redirect_to admin_user?(current_user) ? backoffice_show_users_path(@user) : @user
        else
          render 'edit_password'
        end
      else
        render 'edit_password'
      end
    else
      if @user.update_attributes(user_params) #updates all params of user
        flash[:success] = "Perfil Atualizado!"
        redirect_to admin_user?(current_user) ? backoffice_show_users_path(@user) : @user
      else
        if params[:password].present?
          render 'backoffice/edit_user_password'
        elsif params[:user][:backoffice].present? && params[:user][:backoffice]
          render 'backoffice/edit_users'
        else
          render 'edit'
        end
      end
    end
  end

  def new_candidate
    @user = User.new
  end

  def new_entitie
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :entitie, :address, :postal_code, :locality,
                                 :phone, :cellphone, :page, :birth_date, :idnum, :prof_area, :presentation,
                                 :skill_level, :skills, :prof_situation, :prof_experience, :picture, :activated, :curriculum)
  end

  #filters parameters from params
  def filtering_params(params)
    params.slice(:search,:prof_area,:prof_situation,:locality)
  end
end