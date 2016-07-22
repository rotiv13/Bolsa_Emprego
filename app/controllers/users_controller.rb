class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    if params[:search]
      @users = @users.search(params[:search])
    end
    if params[:locality]
      @user = @users.filter(param[:locality])
    end
    if params[:field]
      @user = @users.local(param[:locality])
    end
    if params[:entitie] == 'true'
      @users = @users.where(entitie: 't').paginate(page: params[:page], per_page: 8)
      @title = 'Entidades'
    else
      @users = @users.where(entitie: 'f').paginate(page: params[:page], per_page: 8)
      @title = 'Candidatos'
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Registo concluído com sucesso"
      redirect_to @user
    else
      if @user.entitie
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
      redirect_to @user
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
                                 :skill_level, :skills, :prof_situation, :prof_experience)
  end
end