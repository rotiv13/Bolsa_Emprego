class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]

  def show
    @user = User.find(params[:id])
    @offers = @user.offers
    @offers_active = @offers.where(active: true).limit(4)
    @offers_limit = @offers_active.limit(2)
    @offers_deactive = @offers.where(active: false).limit(2)

  end


  def index_candidate
    @users = User.all.where(entitie: '1')
    if params[:search]
      @users = @users.search(params[:search])
    end
    if params['/index/candidate']
      if params['/index/candidate'][:locality]
        @users = @users.local(params['/index/candidate'][:locality])
      end
      if params['/index/candidate'][:field]
        @users = @users.filter(params['/index/candidate'][:field])
      end
      if params['/index/candidate'][:situation]
        @users = @users.situation(params['/index/candidate'][:situation])
      end
    end
    @users = @users.paginate(page: params[:page], per_page: 8)
  end

  def index_entitie
    @users = User.all.where(entitie: '2')
    if params[:search]
      @users = @users.search(params[:search])
    end
    if params['/index/entitie']
      if params['/index/entitie'][:locality]
        @users = @users.local(params['/index/entitie'][:locality])
      end
      if params['/index/entitie'][:field]
        @users = @users.filter(params['/index/entitie'][:field])
      end
    end
    @users = @users.paginate(page: params[:page], per_page: 8)
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
      if @user.entitie == '2'
        render 'new_entitie'
      else
        render 'new_candidate'
      end
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
  end

  def new_entitie
    @user = User.new
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :entitie, :address, :postal_code, :locality,
                                 :phone, :cellphone, :page, :birth_date, :idnum, :prof_area, :presentation,
                                 :skill_level, :skills, :prof_situation, :prof_experience,:picture, :activated, :curriculum)
  end



  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) || admin_user?(current_user)
  end


end