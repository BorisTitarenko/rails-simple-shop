class SalesController < ApplicationController
  def index
    @current_sales = current_user.instruments.where(status: 'waiting')
  end

  def update
    instrument = current_user.instruments.find(params[:id])
      if instrument
        instrument.sold_out!
        redirect_to "/"
      end
  end

  def destroy
    instrument = current_user.instruments.find(params[:id])
    if instrument
      instrument.active!
      redirect_to "/"
    end
  end
end
