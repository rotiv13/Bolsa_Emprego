class NewsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :admin_user , only: [:edit, :update, :destroy]
  def new
    @news = News.new
  end


  def edit
    @news = News.find(params[:id])
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
      redirect_to backoffice_show_news_path(@news)
    else
      render 'new'
    end
  end

  def update
    @news = News.find(params[:id])
    if @news.update_attributes(news_params)
      flash[:success] = "Notícia actualizada!"
      redirect_to backoffice_show_news_path(@news)
    else
      render 'backoffice/edit_news'
    end
  end

  def destroy
    News.find(params[:id]).destroy
    flash[:success] = "Notícia apagada!"
    redirect_to backoffice_news_url
  end


  private
  def news_params
    params.require(:news).permit(:title, :date, :summary, :text, :destaque, :active, :picture)
  end
end