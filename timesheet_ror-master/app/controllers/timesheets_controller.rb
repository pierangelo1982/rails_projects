class TimesheetsController < ApplicationController
  before_action :set_timesheet, only: [:show, :edit, :update, :destroy]

  protect_from_forgery :except => [:index, :show, :update, :destroy, :create]

  # GET /timesheets
  # GET /timesheets.json
  def index
    #@timesheets = Timesheet.all
    @timesheets = Timesheet.where(nil)
    @timesheets = Timesheet.where("worker_id=?", params[:ricerca]) if params[:ricerca].present?
    @timesheets = Timesheet.where("inizio=?", params[:begin]) if params[:begin].present?
  end


  def giornate
    @timesheets = initialize_grid(Timesheet, per_page: 30)
  end

  # GET /timesheets/1
  # GET /timesheets/1.json
  def show
  end

  # GET /timesheets/new
  def new
    @timesheet = Timesheet.new
  end

  # GET /timesheets/1/edit
  def edit
  end


  def accettatosi
    @timesheet = Timesheet.find(params[:id])
    @timesheet.update_attributes(confermato: true)
    redirect_to :back, notice: 'Aggiornato'
  end

  def accettatono
    @timesheet = Timesheet.find(params[:id])
    @timesheet.update_attributes(confermato: false)
    redirect_to :back, notice: 'Aggiornato'
  end


  # POST /timesheets
  # POST /timesheets.json
  def create
    @timesheet = Timesheet.new(timesheet_params)
    #@timesheet = Timesheet.new(params.require(:timesheet).permit!)

    respond_to do |format|
      if @timesheet.save
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully created.' }
        format.json { render :show, status: :created, location: @timesheet }
        #format.json{ render :json => @timesheet, :status => :created }
      else
        format.html { render :new }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timesheets/1
  # PATCH/PUT /timesheets/1.json
  def update
    respond_to do |format|
      if @timesheet.update(timesheet_params)
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @timesheet }
      else
        format.html { render :edit }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheets/1
  # DELETE /timesheets/1.json
  def destroy
    @timesheet.destroy
    respond_to do |format|
      format.html { redirect_to timesheets_url, notice: 'Timesheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet
      @timesheet = Timesheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timesheet_params
      #params.require(:timesheet).permit(:worker_id, :data, :inizio, :fine, :ore, :costo, :location, :latitudine, :longitudine, :confermato)
      params.require(:timesheet).permit(:worker_id, :custumer_id, :data, :inizio, :fine, :ore, :costo, :location, :latitudine, :longitudine, :latitudine_fine, :longitudine_fine, :note, :confermato)
    end
end
