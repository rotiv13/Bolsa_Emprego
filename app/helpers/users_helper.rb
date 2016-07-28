module UsersHelper
  def type(user)
    if user
      if user.entitie == '2'
        "Entidade"
      elsif user.entitie == '1'
        "Candidato"
      else
        "Backoffice"
      end
    end
  end

  def user_active(user)
    if user.activated
      "Sim"
    else
      "Não"
    end
  end
end
