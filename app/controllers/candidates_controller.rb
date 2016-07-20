class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
  end

  def index
    @candidates = Candidate.paginate(page: params[:page])
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      flash[:success] = "Registo com sucesso"
      redirect_to candidate_path(@candidate)
    else
      render candidates_new_path
    end
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :email, :password,
                                      :password_confirmation, :address,
                                    :postal_code, :locality, :phone, :cellphone,
                                    :page, :ccid, :profession_area, :presentation,
                                    :date_of_birth, :habilitations, :skills,
                                    :professional_situ, :professional_exp)
  end
end
