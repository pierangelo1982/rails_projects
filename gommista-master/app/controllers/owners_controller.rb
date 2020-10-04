class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /owners
  # GET /owners.json
  def index
    @owners = Owner.order('denominazione').where(nil) # creates an anonymous scope
    @owners = @owners.order('denominazione').where("denominazione like?", "%#{params[:ricerca]}%") if params[:ricerca].present?
    #@owners = Owner.order('denominazione').all
  end

  # GET /owners/1
  # GET /owners/1.json
  def show
  end

  # GET /owners/new
  def new
    @owner = Owner.new
  end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners
  # POST /owners.json
  def create
    @owner = Owner.new(owner_params)

    respond_to do |format|
      if @owner.save
        format.html { redirect_to (:back), notice: 'Nuova Anagrafica Inserita' }
        format.json { render json: @owner, status: :created, location: @owner, content_type: 'text/json' }
      else
        format.html { render action: 'new' }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owners/1
  # PATCH/PUT /owners/1.json
  def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to @owner, notice: 'Owner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @owner = Owner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owner_params
      params.require(:owner).permit(:denominazione, :indirizzo, :cap, :citta, :telefono, :fax, :cellulare, :email, :piva, :codfisc, :car, :created, :modified)
    end
end
