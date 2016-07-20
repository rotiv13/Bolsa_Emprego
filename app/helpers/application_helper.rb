module ApplicationHelper
  #Retorna o titulo completo para cada página especifica
  def full_title(page_title = ' ')
    base_title = "Bolsa de Emprego"
    if page_title.empty?
      base_title
    else
      page_title + " | " +base_title
    end
  end

end
