require 'test_helper'

class VehicleCardAcceptancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle_card_acceptance = vehicle_card_acceptances(:one)
  end

  test "should get index" do
    get vehicle_card_acceptances_url
    assert_response :success
  end

  test "should get new" do
    get new_vehicle_card_acceptance_url
    assert_response :success
  end

  test "should create vehicle_card_acceptance" do
    assert_difference('VehicleCardAcceptance.count') do
      post vehicle_card_acceptances_url, params: { vehicle_card_acceptance: { address_book_id: @vehicle_card_acceptance.address_book_id, date_vehicle_reception: @vehicle_card_acceptance.date_vehicle_reception, document_number: @vehicle_card_acceptance.document_number, employee_id: @vehicle_card_acceptance.employee_id, km: @vehicle_card_acceptance.km, note: @vehicle_card_acceptance.note, serial_number: @vehicle_card_acceptance.serial_number, vehicle_model: @vehicle_card_acceptance.vehicle_model, vehicle_registered_in: @vehicle_card_acceptance.vehicle_registered_in, vehicle_year: @vehicle_card_acceptance.vehicle_year } }
    end

    assert_redirected_to vehicle_card_acceptance_url(VehicleCardAcceptance.last)
  end

  test "should show vehicle_card_acceptance" do
    get vehicle_card_acceptance_url(@vehicle_card_acceptance)
    assert_response :success
  end

  test "should get edit" do
    get edit_vehicle_card_acceptance_url(@vehicle_card_acceptance)
    assert_response :success
  end

  test "should update vehicle_card_acceptance" do
    patch vehicle_card_acceptance_url(@vehicle_card_acceptance), params: { vehicle_card_acceptance: { address_book_id: @vehicle_card_acceptance.address_book_id, date_vehicle_reception: @vehicle_card_acceptance.date_vehicle_reception, document_number: @vehicle_card_acceptance.document_number, employee_id: @vehicle_card_acceptance.employee_id, km: @vehicle_card_acceptance.km, note: @vehicle_card_acceptance.note, serial_number: @vehicle_card_acceptance.serial_number, vehicle_model: @vehicle_card_acceptance.vehicle_model, vehicle_registered_in: @vehicle_card_acceptance.vehicle_registered_in, vehicle_year: @vehicle_card_acceptance.vehicle_year } }
    assert_redirected_to vehicle_card_acceptance_url(@vehicle_card_acceptance)
  end

  test "should destroy vehicle_card_acceptance" do
    assert_difference('VehicleCardAcceptance.count', -1) do
      delete vehicle_card_acceptance_url(@vehicle_card_acceptance)
    end

    assert_redirected_to vehicle_card_acceptances_url
  end
end
