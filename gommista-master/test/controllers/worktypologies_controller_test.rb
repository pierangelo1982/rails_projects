require 'test_helper'

class WorktypologiesControllerTest < ActionController::TestCase
  setup do
    @worktypology = worktypologies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worktypologies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worktypology" do
    assert_difference('Worktypology.count') do
      post :create, worktypology: { nome: @worktypology.nome, prezzo: @worktypology.prezzo }
    end

    assert_redirected_to worktypology_path(assigns(:worktypology))
  end

  test "should show worktypology" do
    get :show, id: @worktypology
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @worktypology
    assert_response :success
  end

  test "should update worktypology" do
    patch :update, id: @worktypology, worktypology: { nome: @worktypology.nome, prezzo: @worktypology.prezzo }
    assert_redirected_to worktypology_path(assigns(:worktypology))
  end

  test "should destroy worktypology" do
    assert_difference('Worktypology.count', -1) do
      delete :destroy, id: @worktypology
    end

    assert_redirected_to worktypologies_path
  end
end
