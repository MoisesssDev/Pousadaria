class GuesthousesController < ApplicationController
  def new
    @guesthouse = Guesthouse.new
  end

  def create
    @user = current_user
    @guesthouse = @user.build_guesthouse(guesthouse_params)
    
    
    if @guesthouse.save
      redirect_to root_path, notice: "Pousada cadastrada com sucesso"     
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @guesthouse = Guesthouse.find(
    params[:id]
    )
    @rooms = @guesthouse.rooms.where(available: true)
  end
  private

  def guesthouse_params
    params.require(:guesthouse).permit(:name, :legal_name, :cnpj, :phone, :email, 
                                       :address, :district, :state, :city, :cep, 
                                       :description, :accepted_payment_methods, 
                                       :accepts_pets, :policies, :check_in_time, :check_out_time)
  end
end
