class CustumerBanksController < ApplicationController
  before_action :set_custumer_bank, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  # GET /custumer_banks
  # GET /custumer_banks.json
  def index
    @custumer_banks = CustumerBank.all
  end

  # GET /custumer_banks/1
  # GET /custumer_banks/1.json
  def show
  end

  # GET /custumer_banks/new
  def new
    @custumer_bank = CustumerBank.new
  end

  # GET /custumer_banks/1/edit
  def edit
  end

  # POST /custumer_banks
  # POST /custumer_banks.json
  def create
    @custumer_bank = CustumerBank.new(custumer_bank_params)

    respond_to do |format|
      if @custumer_bank.save
        format.html { redirect_to @custumer_bank, notice: 'Custumer bank was successfully created.' }
        format.json { render :show, status: :created, location: @custumer_bank }
      else
        format.html { render :new }
        format.json { render json: @custumer_bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custumer_banks/1
  # PATCH/PUT /custumer_banks/1.json
  def update
    respond_to do |format|
      if @custumer_bank.update(custumer_bank_params)
        format.html { redirect_to @custumer_bank, notice: 'Custumer bank was successfully updated.' }
        format.json { render :show, status: :ok, location: @custumer_bank }
      else
        format.html { render :edit }
        format.json { render json: @custumer_bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custumer_banks/1
  # DELETE /custumer_banks/1.json
  def destroy
    @custumer_bank.destroy
    respond_to do |format|
      format.html { redirect_to custumer_banks_url, notice: 'Custumer bank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custumer_bank
      @custumer_bank = CustumerBank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custumer_bank_params
      params.require(:custumer_bank).permit(:custumer_id, :banca, :abi, :cab, :numero_conto, :iban)
    end
end
