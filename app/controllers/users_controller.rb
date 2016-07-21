class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.entitie?
      render 'entitie'
    else
      render 'candidate'
    end
  end

  def index
    if params[:entitie] == 'true'
      @users = User.where(entitie: 't').paginate(page: params[:page], per_page: 8)
      @title = 'Entidades'
    else
      @users = User.where(entitie: 'f').paginate(page: params[:page], per_page: 8)
      @title = 'Candidatos'
    end
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
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