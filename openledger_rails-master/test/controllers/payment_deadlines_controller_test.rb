require 'test_helper'

class PaymentDeadlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_deadline = payment_deadlines(:one)
  end

  test "should get index" do
    get payment_deadlines_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_deadline_url
    assert_response :success
  end

  test "should create payment_deadline" do
    assert_difference('PaymentDeadline.count') do
      post payment_deadlines_url, params: { payment_deadline: { data: @payment_deadline.data, invoice_id: @payment_deadline.invoice_id, paid: @payment_deadline.paid, price: @payment_deadline.price } }
    end

    assert_redirected_to payment_deadline_url(PaymentDeadline.last)
  end

  test "should show payment_deadline" do
    get payment_deadline_url(@payment_deadline)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_deadline_url(@payment_deadline)
    assert_response :success
  end

  test "should update payment_deadline" do
    patch payment_deadline_url(@payment_deadline), params: { payment_deadline: { data: @payment_deadline.data, invoice_id: @payment_deadline.invoice_id, paid: @payment_deadline.paid, price: @payment_deadline.price } }
    assert_redirected_to payment_deadline_url(@payment_deadline)
  end

  test "should destroy payment_deadline" do
    assert_difference('PaymentDeadline.count', -1) do
      delete payment_deadline_url(@payment_deadline)
    end

    assert_redirected_to payment_deadlines_url
  end
end
