module NewsHelper
  def news_active(news)
    if news.active
      "Sim"
    else
      "Não"
    end
  end

  def news_destaque(news)
    if news.destaque
      "Sim"
    else
      "Não"
    end
  end
end
