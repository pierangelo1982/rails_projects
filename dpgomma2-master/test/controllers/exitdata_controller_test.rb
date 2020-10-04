require 'test_helper'

class ExitdataControllerTest < ActionController::TestCase
  setup do
    @exitdatum = exitdata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exitdata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exitdatum" do
    assert_difference('Exitdatum.count') do
      post :create, exitdatum: { azienda_id: @exitdatum.azienda_id, descrizione: @exitdatum.descrizione, lavorazione_id: @exitdatum.lavorazione_id, pezzo_id: @exitdatum.pezzo_id, quantita: @exitdatum.quantita }
    end

    assert_redirected_to exitdatum_path(assigns(:exitdatum))
  end

  test "should show exitdatum" do
    get :show, id: @exitdatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exitdatum
    assert_response :success
  end

  test "should update exitdatum" do
    patch :update, id: @exitdatum, exitdatum: { azienda_id: @exitdatum.azienda_id, descrizione: @exitdatum.descrizione, lavorazione_id: @exitdatum.lavorazione_id, pezzo_id: @exitdatum.pezzo_id, quantita: @exitdatum.quantita }
    assert_redirected_to exitdatum_path(assigns(:exitdatum))
  end

  test "should destroy exitdatum" do
    assert_difference('Exitdatum.count', -1) do
      delete :destroy, id: @exitdatum
    end

    assert_redirected_to exitdata_path
  end
end
