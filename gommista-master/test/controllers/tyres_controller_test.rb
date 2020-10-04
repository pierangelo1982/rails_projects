require 'test_helper'

class TyresControllerTest < ActionController::TestCase
  setup do
    @tyre = tyres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tyres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tyre" do
    assert_difference('Tyre.count') do
      post :create, tyre: { blocco: @tyre.blocco, car_id: @tyre.car_id, colonna: @tyre.colonna, consegna: @tyre.consegna, created: @tyre.created, km: @tyre.km, marca: @tyre.marca, modello: @tyre.modello, modified: @tyre.modified, piano: @tyre.piano, ritiro: @tyre.ritiro, scaffale: @tyre.scaffale, tipologia: @tyre.tipologia, usura: @tyre.usura }
    end

    assert_redirected_to tyre_path(assigns(:tyre))
  end

  test "should show tyre" do
    get :show, id: @tyre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tyre
    assert_response :success
  end

  test "should update tyre" do
    patch :update, id: @tyre, tyre: { blocco: @tyre.blocco, car_id: @tyre.car_id, colonna: @tyre.colonna, consegna: @tyre.consegna, created: @tyre.created, km: @tyre.km, marca: @tyre.marca, modello: @tyre.modello, modified: @tyre.modified, piano: @tyre.piano, ritiro: @tyre.ritiro, scaffale: @tyre.scaffale, tipologia: @tyre.tipologia, usura: @tyre.usura }
    assert_redirected_to tyre_path(assigns(:tyre))
  end

  test "should destroy tyre" do
    assert_difference('Tyre.count', -1) do
      delete :destroy, id: @tyre
    end

    assert_redirected_to tyres_path
  end
end
