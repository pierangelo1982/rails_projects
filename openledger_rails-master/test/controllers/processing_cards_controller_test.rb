require 'test_helper'

class ProcessingCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @processing_card = processing_cards(:one)
  end

  test "should get index" do
    get processing_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_processing_card_url
    assert_response :success
  end

  test "should create processing_card" do
    assert_difference('ProcessingCard.count') do
      post processing_cards_url, params: { processing_card: { address_book_id: @processing_card.address_book_id, date_receipt: @processing_card.date_receipt, doc_nummber: @processing_card.doc_nummber, employee_id: @processing_card.employee_id, km: @processing_card.km, note: @processing_card.note, vehicle_model: @processing_card.vehicle_model, vehicle_registered: @processing_card.vehicle_registered, vehicle_rif: @processing_card.vehicle_rif, vehicle_year: @processing_card.vehicle_year } }
    end

    assert_redirected_to processing_card_url(ProcessingCard.last)
  end

  test "should show processing_card" do
    get processing_card_url(@processing_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_processing_card_url(@processing_card)
    assert_response :success
  end

  test "should update processing_card" do
    patch processing_card_url(@processing_card), params: { processing_card: { address_book_id: @processing_card.address_book_id, date_receipt: @processing_card.date_receipt, doc_nummber: @processing_card.doc_nummber, employee_id: @processing_card.employee_id, km: @processing_card.km, note: @processing_card.note, vehicle_model: @processing_card.vehicle_model, vehicle_registered: @processing_card.vehicle_registered, vehicle_rif: @processing_card.vehicle_rif, vehicle_year: @processing_card.vehicle_year } }
    assert_redirected_to processing_card_url(@processing_card)
  end

  test "should destroy processing_card" do
    assert_difference('ProcessingCard.count', -1) do
      delete processing_card_url(@processing_card)
    end

    assert_redirected_to processing_cards_url
  end
end
