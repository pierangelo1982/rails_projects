require 'test_helper'

class QuestionariodataControllerTest < ActionController::TestCase
  setup do
    @questionariodatum = questionariodata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questionariodata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questionariodatum" do
    assert_difference('Questionariodatum.count') do
      post :create, questionariodatum: { answer_id: @questionariodatum.answer_id, question_id: @questionariodatum.question_id, questionario_id: @questionariodatum.questionario_id }
    end

    assert_redirected_to questionariodatum_path(assigns(:questionariodatum))
  end

  test "should show questionariodatum" do
    get :show, id: @questionariodatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questionariodatum
    assert_response :success
  end

  test "should update questionariodatum" do
    patch :update, id: @questionariodatum, questionariodatum: { answer_id: @questionariodatum.answer_id, question_id: @questionariodatum.question_id, questionario_id: @questionariodatum.questionario_id }
    assert_redirected_to questionariodatum_path(assigns(:questionariodatum))
  end

  test "should destroy questionariodatum" do
    assert_difference('Questionariodatum.count', -1) do
      delete :destroy, id: @questionariodatum
    end

    assert_redirected_to questionariodata_path
  end
end
