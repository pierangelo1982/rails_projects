require 'test_helper'

class EntrataControllerTest < ActionController::TestCase
  setup do
    @entratum = entrata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entrata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entratum" do
    assert_difference('Entratum.count') do
      post :create, entratum: { azienda_id: @entratum.azienda_id, colli: @entratum.colli, consegnato_da: @entratum.consegnato_da, data: @entratum.data, data_ricezione: @entratum.data_ricezione, imballo: @entratum.imballo, mumero: @entratum.mumero, note: @entratum.note, riserva: @entratum.riserva }
    end

    assert_redirected_to entratum_path(assigns(:entratum))
  end

  test "should show entratum" do
    get :show, id: @entratum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entratum
    assert_response :success
  end

  test "should update entratum" do
    patch :update, id: @entratum, entratum: { azienda_id: @entratum.azienda_id, colli: @entratum.colli, consegnato_da: @entratum.consegnato_da, data: @entratum.data, data_ricezione: @entratum.data_ricezione, imballo: @entratum.imballo, mumero: @entratum.mumero, note: @entratum.note, riserva: @entratum.riserva }
    assert_redirected_to entratum_path(assigns(:entratum))
  end

  test "should destroy entratum" do
    assert_difference('Entratum.count', -1) do
      delete :destroy, id: @entratum
    end

    assert_redirected_to entrata_path
  end
end
