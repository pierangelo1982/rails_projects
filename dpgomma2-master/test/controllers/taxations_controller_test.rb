require 'test_helper'

class TaxationsControllerTest < ActionController::TestCase
  setup do
    @taxation = taxations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taxations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taxation" do
    assert_difference('Taxation.count') do
      post :create, taxation: { descrizione: @taxation.descrizione, titolo: @taxation.titolo, valore: @taxation.valore }
    end

    assert_redirected_to taxation_path(assigns(:taxation))
  end

  test "should show taxation" do
    get :show, id: @taxation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @taxation
    assert_response :success
  end

  test "should update taxation" do
    patch :update, id: @taxation, taxation: { descrizione: @taxation.descrizione, titolo: @taxation.titolo, valore: @taxation.valore }
    assert_redirected_to taxation_path(assigns(:taxation))
  end

  test "should destroy taxation" do
    assert_difference('Taxation.count', -1) do
      delete :destroy, id: @taxation
    end

    assert_redirected_to taxations_path
  end
end
