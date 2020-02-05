class ReservationsController < ApplicationController
   before_action :authenticate_user!
   before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  def new
  	@reservation = Reservation.new
  end

  def edit
  end

  def create
  	@reservation = Reservation.new(reservation_params)
  	@reservation.user_id = current_user.id if current_user
    @event = Event.new(reservation_params[:event_attributes])

  	if @reservation.save
  		redirect_to @reservation
  	else
  		render :action => 'new'
  	end
  end
 	
  def show
  end

  def update
  	@reservation = Reservation.find(params[:id])

  	if @reservation.update(params[:reservation])
  		redirect_to @reservation
  	else
  		render :action => 'edit'
  	end
  end

  def index
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:payed, :user_id, :photographer_id, 
      	event_attributes: [:id, :category, :date])
    end

end
