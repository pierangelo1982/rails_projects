require "prawn"



class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /invoices
  # GET /invoices.json
  def index
    @tasks_grid = initialize_grid(Invoice, per_page: 30)
    #@invoices = Invoice.all
    @invoices = Invoice.where(nil) # creates an anonymous scope
    @invoices = Invoice.where('extract(year  from data)=?', params[:annuale]) if params[:annuale].present?
  end


  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  def fattura
    @invoice = Invoice.find(params[:id])
    Prawn::Document.new(:page_size => 'A4')
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @entratax = Entratum.all
    @invoice.scadenzapagamentos.build
    @invoice.invoiceextras.build


  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:azienda_id, :data, :numero, { exit_ids:[] }, :netto, :tax, :totale, :note, :pagamento, :pagato, :inviata, :taxation_id,
        scadenzapagamentos_attributes: [:id, :invoice_id, :scadenza, :note, :_destroy],
        invoiceextras_attributes: [:id, :invoice_id, :codice, :descrizione, :quantita, :prezzounitario, :prezzo, :_destroy])
    end
end
