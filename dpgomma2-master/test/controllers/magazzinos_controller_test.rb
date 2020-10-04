require 'test_helper'

class MagazzinosControllerTest < ActionController::TestCase
  setup do
    @magazzino = magazzinos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:magazzinos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create magazzino" do
    assert_difference('Magazzino.count') do
      post :create, magazzino: { azienda_id: @magazzino.azienda_id, inlavorazio: @magazzino.inlavorazio, npezzi: @magazzino.npezzi, pronti: @magazzino.pronti }
    end

    assert_redirected_to magazzino_path(assigns(:magazzino))
  end

  test "should show magazzino" do
    get :show, id: @magazzino
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @magazzino
    assert_response :success
  end

  test "should update magazzino" do
    patch :update, id: @magazzino, magazzino: { azienda_id: @magazzino.azienda_id, inlavorazio: @magazzino.inlavorazio, npezzi: @magazzino.npezzi, pronti: @magazzino.pronti }
    assert_redirected_to magazzino_path(assigns(:magazzino))
  end

  test "should destroy magazzino" do
    assert_difference('Magazzino.count', -1) do
      delete :destroy, id: @magazzino
    end

    assert_redirected_to magazzinos_path
  end
end
