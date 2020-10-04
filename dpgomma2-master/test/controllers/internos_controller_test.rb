require 'test_helper'

class InternosControllerTest < ActionController::TestCase
  setup do
    @interno = internos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:internos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interno" do
    assert_difference('Interno.count') do
      post :create, interno: { aspetto: @interno.aspetto, azienda_id: @interno.azienda_id, colli: @interno.colli, data: @interno.data, note: @interno.note, note: @interno.note, operatore_id: @interno.operatore_id, riconsegnato: @interno.riconsegnato, rif_ddt: @interno.rif_ddt, trasporto: @interno.trasporto }
    end

    assert_redirected_to interno_path(assigns(:interno))
  end

  test "should show interno" do
    get :show, id: @interno
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interno
    assert_response :success
  end

  test "should update interno" do
    patch :update, id: @interno, interno: { aspetto: @interno.aspetto, azienda_id: @interno.azienda_id, colli: @interno.colli, data: @interno.data, note: @interno.note, note: @interno.note, operatore_id: @interno.operatore_id, riconsegnato: @interno.riconsegnato, rif_ddt: @interno.rif_ddt, trasporto: @interno.trasporto }
    assert_redirected_to interno_path(assigns(:interno))
  end

  test "should destroy interno" do
    assert_difference('Interno.count', -1) do
      delete :destroy, id: @interno
    end

    assert_redirected_to internos_path
  end
end
