class ScadenzapagamentosController < ApplicationController
  before_action :set_scadenzapagamento, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @scadenzapagamentos = Scadenzapagamento.all
    respond_with(@scadenzapagamentos)
  end

  def show
    respond_with(@scadenzapagamento)
  end

  def new
    @scadenzapagamento = Scadenzapagamento.new
    respond_with(@scadenzapagamento)
  end

  def edit
  end

  def create
    @scadenzapagamento = Scadenzapagamento.new(scadenzapagamento_params)
    @scadenzapagamento.save
    respond_with(@scadenzapagamento)
  end

  def update
    @scadenzapagamento.update(scadenzapagamento_params)
    respond_with(@scadenzapagamento)
  end

  def destroy
    @scadenzapagamento.destroy
    respond_with(@scadenzapagamento)
  end

  private
    def set_scadenzapagamento
      @scadenzapagamento = Scadenzapagamento.find(params[:id])
    end

    def scadenzapagamento_params
      params.require(:scadenzapagamento).permit(:invoice_id, :scadenza, :note)
    end
end
