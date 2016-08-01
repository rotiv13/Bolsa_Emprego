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
    if params[:search]
      @news  = @news.search(params[:search])
    end
    @news = @news.paginate(page: params[:page], per_page: 10)
  end

  def index_users
    @users = User.all
    if params[:search]
      @users = @users.search(params[:search])
    end
    if params['/backoffice/users']
      if params['/backoffice/users'][:type]
        @users = @users.type(params['/backoffice/users'][:type]).paginate(page: params[:page], per_page: 8)
        @users
      end
    end
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

  def edit_news
    @news = News.find(params[:id])
  end

end
