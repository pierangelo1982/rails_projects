require 'test_helper'

class ScriviworksControllerTest < ActionController::TestCase
  setup do
    @scriviwork = scriviworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scriviworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scriviwork" do
    assert_difference('Scriviwork.count') do
      post :create, scriviwork: { codice: @scriviwork.codice, descrizione: @scriviwork.descrizione, extrawork_id: @scriviwork.extrawork_id, importo: @scriviwork.importo, quantita: @scriviwork.quantita }
    end

    assert_redirected_to scriviwork_path(assigns(:scriviwork))
  end

  test "should show scriviwork" do
    get :show, id: @scriviwork
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scriviwork
    assert_response :success
  end

  test "should update scriviwork" do
    patch :update, id: @scriviwork, scriviwork: { codice: @scriviwork.codice, descrizione: @scriviwork.descrizione, extrawork_id: @scriviwork.extrawork_id, importo: @scriviwork.importo, quantita: @scriviwork.quantita }
    assert_redirected_to scriviwork_path(assigns(:scriviwork))
  end

  test "should destroy scriviwork" do
    assert_difference('Scriviwork.count', -1) do
      delete :destroy, id: @scriviwork
    end

    assert_redirected_to scriviworks_path
  end
end
