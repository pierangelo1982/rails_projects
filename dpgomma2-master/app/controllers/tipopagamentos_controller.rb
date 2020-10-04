class TipopagamentosController < ApplicationController
  before_action :set_tipopagamento, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tipopagamentos = Tipopagamento.all
    respond_with(@tipopagamentos)
  end

  def show
    respond_with(@tipopagamento)
  end

  def new
    @tipopagamento = Tipopagamento.new
    respond_with(@tipopagamento)
  end

  def edit
  end

  def create
    @tipopagamento = Tipopagamento.new(tipopagamento_params)
    @tipopagamento.save
    respond_with(@tipopagamento)
  end

  def update
    @tipopagamento.update(tipopagamento_params)
    respond_with(@tipopagamento)
  end

  def destroy
    @tipopagamento.destroy
    respond_with(@tipopagamento)
  end

  private
    def set_tipopagamento
      @tipopagamento = Tipopagamento.find(params[:id])
    end

    def tipopagamento_params
      params.require(:tipopagamento).permit(:titolo)
    end
end
