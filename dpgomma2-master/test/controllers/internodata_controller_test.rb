require 'test_helper'

class InternodataControllerTest < ActionController::TestCase
  setup do
    @internodatum = internodata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:internodata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create internodatum" do
    assert_difference('Internodatum.count') do
      post :create, internodatum: { descrizione: @internodatum.descrizione, interno_id: @internodatum.interno_id, quantita: @internodatum.quantita }
    end

    assert_redirected_to internodatum_path(assigns(:internodatum))
  end

  test "should show internodatum" do
    get :show, id: @internodatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @internodatum
    assert_response :success
  end

  test "should update internodatum" do
    patch :update, id: @internodatum, internodatum: { descrizione: @internodatum.descrizione, interno_id: @internodatum.interno_id, quantita: @internodatum.quantita }
    assert_redirected_to internodatum_path(assigns(:internodatum))
  end

  test "should destroy internodatum" do
    assert_difference('Internodatum.count', -1) do
      delete :destroy, id: @internodatum
    end

    assert_redirected_to internodata_path
  end
end
