require 'test_helper'

class ExtraworksControllerTest < ActionController::TestCase
  setup do
    @extrawork = extraworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:extraworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create extrawork" do
    assert_difference('Extrawork.count') do
      post :create, extrawork: { car_id_id: @extrawork.car_id_id, lavoro: @extrawork.lavoro, note: @extrawork.note, prezzo: @extrawork.prezzo, tempo: @extrawork.tempo }
    end

    assert_redirected_to extrawork_path(assigns(:extrawork))
  end

  test "should show extrawork" do
    get :show, id: @extrawork
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @extrawork
    assert_response :success
  end

  test "should update extrawork" do
    patch :update, id: @extrawork, extrawork: { car_id_id: @extrawork.car_id_id, lavoro: @extrawork.lavoro, note: @extrawork.note, prezzo: @extrawork.prezzo, tempo: @extrawork.tempo }
    assert_redirected_to extrawork_path(assigns(:extrawork))
  end

  test "should destroy extrawork" do
    assert_difference('Extrawork.count', -1) do
      delete :destroy, id: @extrawork
    end

    assert_redirected_to extraworks_path
  end
end
