require 'test_helper'

class ExitEntrataControllerTest < ActionController::TestCase
  setup do
    @exit_entratum = exit_entrata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exit_entrata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exit_entratum" do
    assert_difference('ExitEntratum.count') do
      post :create, exit_entratum: { entratum_id: @exit_entratum.entratum_id, exit_id: @exit_entratum.exit_id }
    end

    assert_redirected_to exit_entratum_path(assigns(:exit_entratum))
  end

  test "should show exit_entratum" do
    get :show, id: @exit_entratum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exit_entratum
    assert_response :success
  end

  test "should update exit_entratum" do
    patch :update, id: @exit_entratum, exit_entratum: { entratum_id: @exit_entratum.entratum_id, exit_id: @exit_entratum.exit_id }
    assert_redirected_to exit_entratum_path(assigns(:exit_entratum))
  end

  test "should destroy exit_entratum" do
    assert_difference('ExitEntratum.count', -1) do
      delete :destroy, id: @exit_entratum
    end

    assert_redirected_to exit_entrata_path
  end
end
