module UsersHelper
  def type(user)
    if user.entitie == '0'
      "Backoffice"
    elsif user.entitie == '1'
      "Candidato"
    else
      "Entidade"
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
