class EntitiesController < ApplicationController
  def new
    @entitie = Entitie.new
  end
  def create
    @entitie = Entitie.new(entitie_params)
    if @entitie.save
      flash[:success] = "Registo efectuado com sucesso"
      redirect_to entities_path(@entitie)
    else
      render new_entity_path
    end
  end

  def show
    @entitie = Entitie.find(params[:id])
  end

  private

  def entitie_params
    params.require(:entitie).permit(:name, :email, :password,
                                    :password_confirmation, :address,
                                    :postal_code, :locality, :phone, :cellphone,
                                    :page, :nif, :professional_acti, :presentation)
  end
end
