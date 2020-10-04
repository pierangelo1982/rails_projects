    require 'barby'
    require 'barby/barcode/code_39'
    require 'barby/outputter/png_outputter'
    require 'chunky_png'

    require "prawn"

class CarsController < ApplicationController
  before_action :set_car, only: [:show, :pdf, :edit, :update, :destroy]
  layout "application2", :only => [:show]
  before_action :authenticate_user!


  # GET /cars
  # GET /cars.json
  def index
    #@owners = Owner.order('denominazione').all
    #@cars = Car.includes(:owner).order('owners.denominazione')
    @cars = Car.includes(:owner).order('owners.denominazione').where(nil) # creates an anonymous scope
    @cars = @cars.includes(:owner).order('owners.denominazione').where("owners.denominazione like?", "%#{params[:ricerca]}%") if params[:ricerca].present?
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @work = Work.new
    @tyre = Tyre.new

    @extrawork = Extrawork.new
    @work.worktypes.build
    @extrawork.extralavoroworks.build

    @car =   Car.find(params[:id])
    barcode = Barby::Code39.new(@car.targa, true)
    File.open("app/assets/images/barcodes/#{@car.targa}.png", 'w'){|f|
      f.write barcode.to_png
    }
    File.open("public/barcodes/#{@car.targa}.png", 'w'){|e|
      e.write barcode.to_png
    }

  end


  # GET /cars/pdf/1
  # GET /cars/pdf/1.json
  def pdf
    #render layout: false
    Car.find(params[:id])
    Prawn::Document.generate("app/assets/pdf/#{@car.targa}.pdf")  do |f|
    f.text "Hello Worldd!"
    end
  end

  def stampatarga
    #render layout: false
    Car.find(params[:id])
    @car =   Car.find(params[:id])
    #Prawn::Document.generate("app/assets/pdf2/#{@car.targa}.pdf")  do |f|
    Prawn::Document.new(:landscape => [100000, 200000])
  end

  def stampagomme
    #render layout: false
    Car.find(params[:id])
    @car =   Car.find(params[:id])
    #Prawn::Document.generate("app/assets/pdf2/#{@car.targa}.pdf")  do |f|
    Prawn::Document.new(:landscape => [100000, 200000])
  end

   def stampamagazzino
    #render layout: false
    Car.find(params[:id])
    @car =   Car.find(params[:id])
    #Prawn::Document.generate("app/assets/pdf2/#{@car.targa}.pdf")  do |f|
    Prawn::Document.new(:landscape => [100000, 200000])
  end

  def barcode
    Car.find(params[:id])
    @car =   Car.find(params[:id])
    barcode = Barby::Code39.new(@car.targa, true)
    File.open("app/assets/images/barcodes/#{@car.targa}.png", 'w'){|f|
    f.write barcode.to_png
    }
  end

  # GET /cars/new
  def new
    @car = Car.new
    @owner = Owner.new
    #@tyre = Tyre.new
    @car.tyres.build
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render action: 'show', status: :created, location: @car }
      else
        format.html { render action: 'new' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:targa, :owner_id, :marca, :modello, :anno, :tyre, :libretto, :telaio, :created, :modified,
         owners_attributes: [:denominazione, :indirizzo, :cap, :citta, :telefono, :fax, :cellulare, :email, :piva, :codfisc, :car, :created, :modified],
         tyres_attributes: [:marca, :modello, :tipologia, :consegna, :ritiro, :km, :usura, :location_id, :shelf_id, :block_id, :floor_id, :column_id, :created, :modified, :kit, :deposito, :status])
    end
end
