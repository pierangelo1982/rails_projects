class ProcessingCardsController < ApplicationController
  before_action :set_processing_card, only: [:show, :edit, :update, :destroy]

  # GET /processing_cards
  # GET /processing_cards.json
  def index
    @processing_cards = ProcessingCard.all
  end

  # GET /processing_cards/1
  # GET /processing_cards/1.json
  def show
  end

  # GET /processing_cards/new
  def new
    @processing_card = ProcessingCard.new
  end

  # GET /processing_cards/1/edit
  def edit
  end

  # POST /processing_cards
  # POST /processing_cards.json
  def create
    @processing_card = ProcessingCard.new(processing_card_params)

    respond_to do |format|
      if @processing_card.save
        format.html { redirect_to @processing_card, notice: 'Processing card was successfully created.' }
        format.json { render :show, status: :created, location: @processing_card }
      else
        format.html { render :new }
        format.json { render json: @processing_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processing_cards/1
  # PATCH/PUT /processing_cards/1.json
  def update
    respond_to do |format|
      if @processing_card.update(processing_card_params)
        format.html { redirect_to @processing_card, notice: 'Processing card was successfully updated.' }
        format.json { render :show, status: :ok, location: @processing_card }
      else
        format.html { render :edit }
        format.json { render json: @processing_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processing_cards/1
  # DELETE /processing_cards/1.json
  def destroy
    @processing_card.destroy
    respond_to do |format|
      format.html { redirect_to processing_cards_url, notice: 'Processing card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processing_card
      @processing_card = ProcessingCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processing_card_params
      params.require(:processing_card).permit(:address_book_id, :employee_id, :doc_nummber, :km, :vehicle_rif, :vehicle_year, :vehicle_registered, :vehicle_model, :date_receipt, :note)
    end
end
