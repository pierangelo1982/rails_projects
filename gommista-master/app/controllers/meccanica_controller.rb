class MeccanicaController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def hello
    session['ciao'] = params[:test]
    if Car.exists?(targa: params[:test])
      @cars = Car.where("targa = ?", params[:test])
      ok = @cars.first
      #redirect_to :controller=>'extraworks', :action => 'show', :id => ok.id
      redirect_to extraworks_path()
    else
      session.delete(:ciao)

      redirect_to new_car_path(tmp_targa: params[:test]), notice: 'Targa non presente in archivio inseriscila.'
    end
  end

  def delete
      reset_session
    end

    def resettarga
      session.delete(:ciao)
      redirect_to new_car_path, notice: 'Targa resettata.'
    end
end
