class InstrumentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @instruments = Instrument.all.order("created_at desc")
  end

  def new
    @instrument = current_user.instruments.build
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def create
    @instrument = current_user.instruments.new(instrument_params)
    if @instrument.save
      redirect_to root_path
    else
      redirect_to new_instruments_path
    end
  end

  private
  def instrument_params
    p = params.require(:instrument).permit(:image, :brand, :model, :description, :condition, :finish, :price)
  end
end
