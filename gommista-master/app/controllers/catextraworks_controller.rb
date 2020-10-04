class CatextraworksController < ApplicationController
  before_action :set_catextrawork, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /catextraworks
  # GET /catextraworks.json
  def index
    @catextraworks = Catextrawork.all
  end

  # GET /catextraworks/1
  # GET /catextraworks/1.json
  def show
  end

  # GET /catextraworks/new
  def new
    @catextrawork = Catextrawork.new
  end

  # GET /catextraworks/1/edit
  def edit
  end

  # POST /catextraworks
  # POST /catextraworks.json
  def create
    @catextrawork = Catextrawork.new(catextrawork_params)

    respond_to do |format|
      if @catextrawork.save
        format.html { redirect_to @catextrawork, notice: 'Catextrawork was successfully created.' }
        format.json { render action: 'show', status: :created, location: @catextrawork }
      else
        format.html { render action: 'new' }
        format.json { render json: @catextrawork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catextraworks/1
  # PATCH/PUT /catextraworks/1.json
  def update
    respond_to do |format|
      if @catextrawork.update(catextrawork_params)
        format.html { redirect_to @catextrawork, notice: 'Catextrawork was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @catextrawork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catextraworks/1
  # DELETE /catextraworks/1.json
  def destroy
    @catextrawork.destroy
    respond_to do |format|
      format.html { redirect_to catextraworks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catextrawork
      @catextrawork = Catextrawork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catextrawork_params
      params.require(:catextrawork).permit(:nome, :altro, :prezzo)
    end
end
