require 'test_helper'

class PaymentDeadlinesControllerTest < ActionController::TestCase
  setup do
    @payment_deadline = payment_deadlines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_deadlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_deadline" do
    assert_difference('PaymentDeadline.count') do
      post :create, payment_deadline: { data: @payment_deadline.data, invoice_id: @payment_deadline.invoice_id, note: @payment_deadline.note, testo: @payment_deadline.testo }
    end

    assert_redirected_to payment_deadline_path(assigns(:payment_deadline))
  end

  test "should show payment_deadline" do
    get :show, id: @payment_deadline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_deadline
    assert_response :success
  end

  test "should update payment_deadline" do
    patch :update, id: @payment_deadline, payment_deadline: { data: @payment_deadline.data, invoice_id: @payment_deadline.invoice_id, note: @payment_deadline.note, testo: @payment_deadline.testo }
    assert_redirected_to payment_deadline_path(assigns(:payment_deadline))
  end

  test "should destroy payment_deadline" do
    assert_difference('PaymentDeadline.count', -1) do
      delete :destroy, id: @payment_deadline
    end

    assert_redirected_to payment_deadlines_path
  end
end
