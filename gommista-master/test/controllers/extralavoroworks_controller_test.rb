require 'test_helper'

class ExtralavoroworksControllerTest < ActionController::TestCase
  setup do
    @extralavorowork = extralavoroworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:extralavoroworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create extralavorowork" do
    assert_difference('Extralavorowork.count') do
      post :create, extralavorowork: { lavoro: @extralavorowork.lavoro, work_id: @extralavorowork.work_id }
    end

    assert_redirected_to extralavorowork_path(assigns(:extralavorowork))
  end

  test "should show extralavorowork" do
    get :show, id: @extralavorowork
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @extralavorowork
    assert_response :success
  end

  test "should update extralavorowork" do
    patch :update, id: @extralavorowork, extralavorowork: { lavoro: @extralavorowork.lavoro, work_id: @extralavorowork.work_id }
    assert_redirected_to extralavorowork_path(assigns(:extralavorowork))
  end

  test "should destroy extralavorowork" do
    assert_difference('Extralavorowork.count', -1) do
      delete :destroy, id: @extralavorowork
    end

    assert_redirected_to extralavoroworks_path
  end
end
