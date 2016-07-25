class StaticPagesController < ApplicationController
  def home
    @users = User.all.order(created_at: :desc)
    @entities = @users.where(entitie: '2').limit(3)
    @candidates = @users.where(entitie: '1').limit(3)
    @newss = News.where(destaque: 1).limit(3)
  end

  def help
  end

  def about
  end

  def contact
  end



end
