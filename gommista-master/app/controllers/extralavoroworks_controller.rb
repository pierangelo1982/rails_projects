class ExtralavoroworksController < ApplicationController
  before_action :set_extralavorowork, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /extralavoroworks
  # GET /extralavoroworks.json
  def index
    @extralavoroworks = Extralavorowork.all
  end

  # GET /extralavoroworks/1
  # GET /extralavoroworks/1.json
  def show
  end

  # GET /extralavoroworks/new
  def new
    @extralavorowork = Extralavorowork.new
  end

  # GET /extralavoroworks/1/edit
  def edit
  end

  # POST /extralavoroworks
  # POST /extralavoroworks.json
  def create
    @extralavorowork = Extralavorowork.new(extralavorowork_params)

    respond_to do |format|
      if @extralavorowork.save
        format.html { redirect_to @extralavorowork, notice: 'Extralavorowork was successfully created.' }
        format.json { render action: 'show', status: :created, location: @extralavorowork }
      else
        format.html { render action: 'new' }
        format.json { render json: @extralavorowork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extralavoroworks/1
  # PATCH/PUT /extralavoroworks/1.json
  def update
    respond_to do |format|
      if @extralavorowork.update(extralavorowork_params)
        format.html { redirect_to @extralavorowork, notice: 'Extralavorowork was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @extralavorowork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extralavoroworks/1
  # DELETE /extralavoroworks/1.json
  def destroy
    @extralavorowork.destroy
    respond_to do |format|
      format.html { redirect_to extralavoroworks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extralavorowork
      @extralavorowork = Extralavorowork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extralavorowork_params
      params.require(:extralavorowork).permit(:work_id, :lavoro, :descrizione, :quantita, :codice, :importo, :catextrawork_id)
    end
end
