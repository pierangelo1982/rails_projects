class OperatoresController < ApplicationController
  before_action :set_operatore, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @operatores = Operatore.all
    respond_with(@operatores)
  end

  def show
    respond_with(@operatore)
  end

  def new
    @operatore = Operatore.new
    respond_with(@operatore)
  end

  def edit
  end

  def create
    @operatore = Operatore.new(operatore_params)
    @operatore.save
    respond_with(@operatore)
  end

  def update
    @operatore.update(operatore_params)
    respond_with(@operatore)
  end

  def destroy
    @operatore.destroy
    respond_with(@operatore)
  end

  private
    def set_operatore
      @operatore = Operatore.find(params[:id])
    end

    def operatore_params
      params.require(:operatore).permit(:denominazione, :nome, :cognome, :piva, :codfisc, :indirizzo, :civico, :cap, :citta, :provincia, :tel, :fax, :email, :note)
    end
end
