module OffersHelper
  def prof_activity(offer)
    activity = offer.prof_area
    if activity == '0'
      'Programador Web'
    elsif activity == '1'
      'Web Designer'
    elsif activity == '2'
      'Administrador Sistemas'
    else
      'Administrador Redes'
    end
  end
end
