class TaxationsController < ApplicationController
  before_action :set_taxation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @taxations = Taxation.all
    respond_with(@taxations)
  end

  def show
    respond_with(@taxation)
  end

  def new
    @taxation = Taxation.new
    respond_with(@taxation)
  end

  def edit
  end

  def create
    @taxation = Taxation.new(taxation_params)
    @taxation.save
    respond_with(@taxation)
  end

  def update
    @taxation.update(taxation_params)
    respond_with(@taxation)
  end

  def destroy
    @taxation.destroy
    respond_with(@taxation)
  end

  private
    def set_taxation
      @taxation = Taxation.find(params[:id])
    end

    def taxation_params
      params.require(:taxation).permit(:valore, :titolo, :descrizione)
    end
end
