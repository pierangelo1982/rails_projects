class PurchaseInvoicesController < ApplicationController
  before_action :set_purchase_invoice, only: [:show, :edit, :update, :destroy]

  # GET /purchase_invoices
  # GET /purchase_invoices.json
  def index
    @purchase_invoices = PurchaseInvoice.all
  end

  # GET /purchase_invoices/1
  # GET /purchase_invoices/1.json
  def show
  end

  # GET /purchase_invoices/new
  def new
    @purchase_invoice = PurchaseInvoice.new
    @purchase_invoice.purchase_invoice_items.build
    @purchase_invoice.purchase_payment_deadlines.build
  end

  # GET /purchase_invoices/1/edit
  def edit
  end

  # POST /purchase_invoices
  # POST /purchase_invoices.json
  def create
    @purchase_invoice = PurchaseInvoice.new(purchase_invoice_params)

    respond_to do |format|
      if @purchase_invoice.save
        format.html { redirect_to @purchase_invoice, notice: 'Purchase invoice was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_invoice }
      else
        format.html { render :new }
        format.json { render json: @purchase_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_invoices/1
  # PATCH/PUT /purchase_invoices/1.json
  def update
    respond_to do |format|
      if @purchase_invoice.update(purchase_invoice_params)
        format.html { redirect_to @purchase_invoice, notice: 'Purchase invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_invoice }
      else
        format.html { render :edit }
        format.json { render json: @purchase_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_invoices/1
  # DELETE /purchase_invoices/1.json
  def destroy
    @purchase_invoice.destroy
    respond_to do |format|
      format.html { redirect_to purchase_invoices_url, notice: 'Purchase invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # change status paid
  def paid_status
    @purchase_invoice = PurchaseInvoice.find(params[:id])
    (@purchase_invoice.paid == true) ? @purchase_invoice.update_attributes(paid: false) : @purchase_invoice.update_attributes(paid: true)
    redirect_to :back, notice: 'Pagamento Aggiornato'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_invoice
      @purchase_invoice = PurchaseInvoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_invoice_params
      params.require(:purchase_invoice).permit(:address_book_id, :tax_id, :invoice_number, :invoice_date, :discount, :total_pretax, :total_tax_price, :total_price, :note, :attachment, :payment_method_id, :paid, :other,
              purchase_invoice_items_attributes: [:id, :purchase_invoice_id, :code, :name, :description, :quantity, :discount, :unit_price, :tax_id, :price_pretax, :tax_price, :total_price, :_destroy],
              purchase_payment_deadlines_attributes: [:id, :purchase_invoice_id, :price, :data, :paid, :_destroy])
    end
end
