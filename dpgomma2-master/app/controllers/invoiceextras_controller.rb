class InvoiceextrasController < ApplicationController
  before_action :set_invoiceextra, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @invoiceextras = Invoiceextra.all
    respond_with(@invoiceextras)
  end

  def show
    respond_with(@invoiceextra)
  end

  def new
    @invoiceextra = Invoiceextra.new
    respond_with(@invoiceextra)
  end

  def edit
  end

  def create
    @invoiceextra = Invoiceextra.new(invoiceextra_params)
    @invoiceextra.save
    respond_with(@invoiceextra)
  end

  def update
    @invoiceextra.update(invoiceextra_params)
    respond_with(@invoiceextra)
  end

  def destroy
    @invoiceextra.destroy
    respond_with(@invoiceextra)
  end

  private
    def set_invoiceextra
      @invoiceextra = Invoiceextra.find(params[:id])
    end

    def invoiceextra_params
      params.require(:invoiceextra).permit(:invoice_id, :codice, :descrizione, :quantita, :prezzounitario, :prezzo)
    end
end
