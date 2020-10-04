class ExitEntrataController < ApplicationController
  before_action :set_exit_entratum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /exit_entrata
  # GET /exit_entrata.json
  def index
    @exit_entrata = ExitEntratum.all
  end

  # GET /exit_entrata/1
  # GET /exit_entrata/1.json
  def show
  end

  # GET /exit_entrata/new
  def new
    @exit_entratum = ExitEntratum.new
  end

  # GET /exit_entrata/1/edit
  def edit
  end

  # POST /exit_entrata
  # POST /exit_entrata.json
  def create
    @exit_entratum = ExitEntratum.new(exit_entratum_params)

    respond_to do |format|
      if @exit_entratum.save
        format.html { redirect_to @exit_entratum, notice: 'Exit entratum was successfully created.' }
        format.json { render :show, status: :created, location: @exit_entratum }
      else
        format.html { render :new }
        format.json { render json: @exit_entratum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exit_entrata/1
  # PATCH/PUT /exit_entrata/1.json
  def update
    respond_to do |format|
      if @exit_entratum.update(exit_entratum_params)
        format.html { redirect_to @exit_entratum, notice: 'Exit entratum was successfully updated.' }
        format.json { render :show, status: :ok, location: @exit_entratum }
      else
        format.html { render :edit }
        format.json { render json: @exit_entratum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exit_entrata/1
  # DELETE /exit_entrata/1.json
  def destroy
    @exit_entratum.destroy
    respond_to do |format|
      format.html { redirect_to exit_entrata_url, notice: 'Exit entratum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exit_entratum
      @exit_entratum = ExitEntratum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exit_entratum_params
      params.require(:exit_entratum).permit(:exit_id, :entratum_id)
    end
end
