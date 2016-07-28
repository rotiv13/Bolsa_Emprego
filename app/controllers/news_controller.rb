class NewsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :admin_user , only: [:edit, :update, :destroy]
  def new
    @news = News.new
  end


  def edit
  end


  def show
    @news = News.find(params[:id])
  end

  def index
    @news = News.all
    @news = @news.paginate(page: params[:page], per_page: 10)
  end

  def create
    @news = News.new(news_params)
    if @news.save
      flash[:success] = "Notícia criada com sucesso!"
      redirect_to @news
    else
      render 'new'
    end
  end

  def update

  end

  def destroy
    News.find(params[:id]).destroy
    flash[:success] = "Notícia apagada!"
    redirect_to backoffice_news_url
  end


  private
  def news_params
    params.require(:news).permit(:title, :date, :summary, :text, :destaque, :active)
  end
end