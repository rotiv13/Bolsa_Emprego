class BackofficeController < ApplicationController
  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = "Por favor, verifique o seu email para activar a sua conta."
      redirect_to  backoffice_url(@user)
    else
        render 'new'
      end
  end

  def index
    if params[:data] == "news"
      @news = News.all.paginate(page: params[:page], per_page: 10)
    else
      @users = User.all.paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :entitie, :address, :postal_code, :locality,
                                 :phone, :cellphone, :page, :birth_date, :idnum, :prof_area, :presentation,
                                 :skill_level, :skills, :prof_situation, :prof_experience,:picture)
  end
end
