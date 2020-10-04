class PurchasePaymentDeadlinesController < ApplicationController
  before_action :set_purchase_payment_deadline, only: [:show, :edit, :update, :destroy]

  # GET /purchase_payment_deadlines
  # GET /purchase_payment_deadlines.json
  def index
    @purchase_payment_deadlines = PurchasePaymentDeadline.all
  end

  # GET /purchase_payment_deadlines/1
  # GET /purchase_payment_deadlines/1.json
  def show
  end

  # GET /purchase_payment_deadlines/new
  def new
    @purchase_payment_deadline = PurchasePaymentDeadline.new
  end

  # GET /purchase_payment_deadlines/1/edit
  def edit
  end

  # POST /purchase_payment_deadlines
  # POST /purchase_payment_deadlines.json
  def create
    @purchase_payment_deadline = PurchasePaymentDeadline.new(purchase_payment_deadline_params)

    respond_to do |format|
      if @purchase_payment_deadline.save
        format.html { redirect_to @purchase_payment_deadline, notice: 'Purchase payment deadline was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_payment_deadline }
      else
        format.html { render :new }
        format.json { render json: @purchase_payment_deadline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_payment_deadlines/1
  # PATCH/PUT /purchase_payment_deadlines/1.json
  def update
    respond_to do |format|
      if @purchase_payment_deadline.update(purchase_payment_deadline_params)
        format.html { redirect_to @purchase_payment_deadline, notice: 'Purchase payment deadline was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_payment_deadline }
      else
        format.html { render :edit }
        format.json { render json: @purchase_payment_deadline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_payment_deadlines/1
  # DELETE /purchase_payment_deadlines/1.json
  def destroy
    @purchase_payment_deadline.destroy
    respond_to do |format|
      format.html { redirect_to purchase_payment_deadlines_url, notice: 'Purchase payment deadline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_payment_deadline
      @purchase_payment_deadline = PurchasePaymentDeadline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_payment_deadline_params
      params.require(:purchase_payment_deadline).permit(:purchase_invoice_id, :price, :data, :paid)
    end
end
