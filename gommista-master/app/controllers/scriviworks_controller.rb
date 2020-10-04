class ScriviworksController < ApplicationController
  before_action :set_scriviwork, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /scriviworks
  # GET /scriviworks.json
  def index
    @scriviworks = Scriviwork.all
  end

  # GET /scriviworks/1
  # GET /scriviworks/1.json
  def show
  end

  # GET /scriviworks/new
  def new
    @scriviwork = Scriviwork.new
  end

  # GET /scriviworks/1/edit
  def edit
  end

  # POST /scriviworks
  # POST /scriviworks.json
  def create
    @scriviwork = Scriviwork.new(scriviwork_params)

    respond_to do |format|
      if @scriviwork.save
        format.html { redirect_to @scriviwork, notice: 'Scriviwork was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scriviwork }
      else
        format.html { render action: 'new' }
        format.json { render json: @scriviwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scriviworks/1
  # PATCH/PUT /scriviworks/1.json
  def update
    respond_to do |format|
      if @scriviwork.update(scriviwork_params)
        format.html { redirect_to @scriviwork, notice: 'Scriviwork was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scriviwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scriviworks/1
  # DELETE /scriviworks/1.json
  def destroy
    @scriviwork.destroy
    respond_to do |format|
      format.html { redirect_to scriviworks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scriviwork
      @scriviwork = Scriviwork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scriviwork_params
      params.require(:scriviwork).permit(:extrawork_id, :descrizione, :codice, :quantita, :importo)
    end
end
