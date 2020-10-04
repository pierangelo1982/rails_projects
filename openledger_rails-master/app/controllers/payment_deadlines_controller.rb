class PaymentDeadlinesController < ApplicationController
  before_action :set_payment_deadline, only: [:show, :edit, :update, :destroy]

  # GET /payment_deadlines
  # GET /payment_deadlines.json
  def index
    @payment_deadlines = PaymentDeadline.all
  end

  # GET /payment_deadlines/1
  # GET /payment_deadlines/1.json
  def show
  end

  # GET /payment_deadlines/new
  def new
    @payment_deadline = PaymentDeadline.new
  end

  # GET /payment_deadlines/1/edit
  def edit
  end

  # POST /payment_deadlines
  # POST /payment_deadlines.json
  def create
    @payment_deadline = PaymentDeadline.new(payment_deadline_params)

    respond_to do |format|
      if @payment_deadline.save
        format.html { redirect_to @payment_deadline, notice: 'Payment deadline was successfully created.' }
        format.json { render :show, status: :created, location: @payment_deadline }
      else
        format.html { render :new }
        format.json { render json: @payment_deadline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_deadlines/1
  # PATCH/PUT /payment_deadlines/1.json
  def update
    respond_to do |format|
      if @payment_deadline.update(payment_deadline_params)
        format.html { redirect_to @payment_deadline, notice: 'Payment deadline was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_deadline }
      else
        format.html { render :edit }
        format.json { render json: @payment_deadline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_deadlines/1
  # DELETE /payment_deadlines/1.json
  def destroy
    @payment_deadline.destroy
    respond_to do |format|
      format.html { redirect_to payment_deadlines_url, notice: 'Payment deadline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_deadline
      @payment_deadline = PaymentDeadline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_deadline_params
      params.require(:payment_deadline).permit(:invoice_id, :price, :data, :paid)
    end
end
