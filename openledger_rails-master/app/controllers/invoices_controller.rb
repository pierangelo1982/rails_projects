class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @invoice.invoice_items.build
    @invoice.payment_deadlines.build
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


  # change status paid
  def paid_status
    @invoice = Invoice.find(params[:id])
    (@invoice.paid == true) ? @invoice.update_attributes(paid: false) : @invoice.update_attributes(paid: true)
    redirect_to :back, notice: 'Pagamento Aggiornato'
  end


  #fattura pdf
  def fattura
    @invoice = Invoice.find(params[:id])
    Prawn::Document.new(:page_size => 'A4')
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:address_book_id, :tax_id, :invoice_number, :invoice_date, :discount, :total_pretax, :total_tax_price, :total_price, :note, :payment_method_id, :paid, :other,
              invoice_items_attributes: [:id, :invoice_id, :code, :name, :description, :quantity, :discount, :unit_price, :tax_id, :price_pretax, :tax_price, :total_price, :_destroy],
              payment_deadlines_attributes: [:id, :invoice_id, :price, :data, :paid, :_destroy])
    end
end
