class MagazzinosController < ApplicationController
  before_action :set_magazzino, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @magazzinos = Magazzino.all
    respond_with(@magazzinos)
  end

  def show
    respond_with(@magazzino)
  end

  def new
    @magazzino = Magazzino.new
    respond_with(@magazzino)
  end

  def edit
  end

  def create
    @magazzino = Magazzino.new(magazzino_params)
    @magazzino.save
    respond_with(@magazzino)
  end

  def update
    @magazzino.update(magazzino_params)
    respond_with(@magazzino)
  end

  def destroy
    @magazzino.destroy
    respond_with(@magazzino)
  end

  private
    def set_magazzino
      @magazzino = Magazzino.find(params[:id])
    end

    def magazzino_params
      params.require(:magazzino).permit(:azienda_id, :npezzi, :inlavorazio, :pronti)
    end
end
