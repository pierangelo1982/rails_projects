require 'test_helper'

class LavorazionesControllerTest < ActionController::TestCase
  setup do
    @lavorazione = lavoraziones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lavoraziones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lavorazione" do
    assert_difference('Lavorazione.count') do
      post :create, lavorazione: { codice: @lavorazione.codice, descrizione: @lavorazione.descrizione, pezo_id: @lavorazione.pezo_id, prezzo: @lavorazione.prezzo, sconto: @lavorazione.sconto, titolo: @lavorazione.titolo }
    end

    assert_redirected_to lavorazione_path(assigns(:lavorazione))
  end

  test "should show lavorazione" do
    get :show, id: @lavorazione
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lavorazione
    assert_response :success
  end

  test "should update lavorazione" do
    patch :update, id: @lavorazione, lavorazione: { codice: @lavorazione.codice, descrizione: @lavorazione.descrizione, pezo_id: @lavorazione.pezo_id, prezzo: @lavorazione.prezzo, sconto: @lavorazione.sconto, titolo: @lavorazione.titolo }
    assert_redirected_to lavorazione_path(assigns(:lavorazione))
  end

  test "should destroy lavorazione" do
    assert_difference('Lavorazione.count', -1) do
      delete :destroy, id: @lavorazione
    end

    assert_redirected_to lavoraziones_path
  end
end
