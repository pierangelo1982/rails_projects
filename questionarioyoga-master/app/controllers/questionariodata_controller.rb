class QuestionariodataController < ApplicationController
  before_action :set_questionariodatum, only: [:show, :edit, :update, :destroy]

  # GET /questionariodata
  # GET /questionariodata.json
  def index
    @questionariodata = Questionariodatum.all
  end

  # GET /questionariodata/1
  # GET /questionariodata/1.json
  def show
  end

  # GET /questionariodata/new
  def new
    @questionariodatum = Questionariodatum.new
  end

  # GET /questionariodata/1/edit
  def edit
  end

  # POST /questionariodata
  # POST /questionariodata.json
  def create
    @questionariodatum = Questionariodatum.new(questionariodatum_params)

    respond_to do |format|
      if @questionariodatum.save
        format.html { redirect_to @questionariodatum, notice: 'Questionariodatum was successfully created.' }
        format.json { render :show, status: :created, location: @questionariodatum }
      else
        format.html { render :new }
        format.json { render json: @questionariodatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionariodata/1
  # PATCH/PUT /questionariodata/1.json
  def update
    respond_to do |format|
      if @questionariodatum.update(questionariodatum_params)
        format.html { redirect_to @questionariodatum, notice: 'Questionariodatum was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionariodatum }
      else
        format.html { render :edit }
        format.json { render json: @questionariodatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionariodata/1
  # DELETE /questionariodata/1.json
  def destroy
    @questionariodatum.destroy
    respond_to do |format|
      format.html { redirect_to questionariodata_url, notice: 'Questionariodatum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionariodatum
      @questionariodatum = Questionariodatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionariodatum_params
      params.require(:questionariodatum).permit(:questionario_id, :question_id, :answer_id, :altro)
    end
end
