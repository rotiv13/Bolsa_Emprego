class BackofficeController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user


  def home
    render 'backoffice/home'
  end

  def new
    @user = User.new
  end

  def index_news
    @news = News.all
    @news  = @news.title(params[:title]) if params[:title].present?
    @news = @news.paginate(page: params[:page], per_page: 10)
  end

  def index_users
    @users = User.all.order(created_at: :desc)
    @users = @users.type(params[:entitie]) if params[:entitie].present?
    @users = @users.search(params[:search]) if params[:search].present?
    @users = @users.paginate(page: params[:page], per_page: 10)
  end

  def show_users
    @user = User.find(params[:id])
  end

  def show_news
    @news = News.find(params[:id])
  end

  def edit_users
    @user = User.find(params[:id])
  end

  def edit_user_password
    @user = User.find(params[:id])
  end

  def edit_news
    @news = News.find(params[:id])
  end

end
