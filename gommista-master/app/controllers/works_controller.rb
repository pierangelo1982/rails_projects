class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /works
  # GET /works.json
  def index
    #@works = Work.all
    @works = Work.includes(:car).where(nil) # creates an anonymous scope
    @works = Work.includes(:car).where("cars.targa=?", session['ciao']) if session['ciao'].present?
    @worktypes = Worktype.all
    
  end

  # GET /works/1
  # GET /works/1.json
  def show
  end

  # GET /works/new
  def new
    @work = Work.new
    @all_worktypologies = Worktypology.all
    #3.times{@work.worktypes.build}
    @work.worktypes.build
    #3.times{@work.worktypes.build}
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(work_params)


    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Work was successfully created.' }
        format.json { render action: 'show', status: :created, location: @work }
      else
        format.html { render action: 'new' }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json
  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to @work, notice: 'Work was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:id, :car_id, :tyre_id, :worktypology_ids, :descrizione, :km, :posteriore, :anteriore, :tempo, :prezzo, :created, :modified,
        worktypes_attributes: [:id, :worktypology_id, :ciao, :created_at, :updated_at,
        worktypologies_attributes: [:id, :nome]]
          )
    end
end
