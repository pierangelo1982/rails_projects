class WorktypologiesController < ApplicationController
  before_action :set_worktypology, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /worktypologies
  # GET /worktypologies.json
  def index
    @worktypologies = Worktypology.all
  end

  # GET /worktypologies/1
  # GET /worktypologies/1.json
  def show
  end

  # GET /worktypologies/new
  def new
    @worktypology = Worktypology.new
  end

  # GET /worktypologies/1/edit
  def edit
  end

  # POST /worktypologies
  # POST /worktypologies.json
  def create
    @worktypology = Worktypology.new(worktypology_params)

    respond_to do |format|
      if @worktypology.save
        format.html { redirect_to @worktypology, notice: 'Worktypology was successfully created.' }
        format.json { render action: 'show', status: :created, location: @worktypology }
      else
        format.html { render action: 'new' }
        format.json { render json: @worktypology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worktypologies/1
  # PATCH/PUT /worktypologies/1.json
  def update
    respond_to do |format|
      if @worktypology.update(worktypology_params)
        format.html { redirect_to @worktypology, notice: 'Worktypology was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @worktypology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worktypologies/1
  # DELETE /worktypologies/1.json
  def destroy
    @worktypology.destroy
    respond_to do |format|
      format.html { redirect_to worktypologies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worktypology
      @worktypology = Worktypology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worktypology_params
      params.require(:worktypology).permit(:nome, :prezzo)
    end
end
