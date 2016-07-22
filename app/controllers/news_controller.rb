class NewsController < ApplicationController


  def new
    @news = News.new
  end

  def show
    @news = News.find(params[:id])
  end

  def index
    @news = News.all.paginate(page: params[:page], per_page: 10)
  end

  def create
    @news = News.new(noticia_params)
    if @news.save
      flash[:success] = "Notícia criada com sucesso!"
      redirect_to @news
    else
      render 'new'
    end
  end

  def udpate

  end

  def destroy

  end


  private
  def noticia_params
    params.require(:news).permit(:title, :date, :summary, :text, :destaque, :active)
  end
end