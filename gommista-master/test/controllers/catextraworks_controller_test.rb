require 'test_helper'

class CatextraworksControllerTest < ActionController::TestCase
  setup do
    @catextrawork = catextraworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catextraworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catextrawork" do
    assert_difference('Catextrawork.count') do
      post :create, catextrawork: { altro: @catextrawork.altro, nome: @catextrawork.nome, prezzo: @catextrawork.prezzo }
    end

    assert_redirected_to catextrawork_path(assigns(:catextrawork))
  end

  test "should show catextrawork" do
    get :show, id: @catextrawork
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catextrawork
    assert_response :success
  end

  test "should update catextrawork" do
    patch :update, id: @catextrawork, catextrawork: { altro: @catextrawork.altro, nome: @catextrawork.nome, prezzo: @catextrawork.prezzo }
    assert_redirected_to catextrawork_path(assigns(:catextrawork))
  end

  test "should destroy catextrawork" do
    assert_difference('Catextrawork.count', -1) do
      delete :destroy, id: @catextrawork
    end

    assert_redirected_to catextraworks_path
  end
end
