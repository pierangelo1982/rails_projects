require 'test_helper'

class TimesheetsControllerTest < ActionController::TestCase
  setup do
    @timesheet = timesheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timesheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timesheet" do
    assert_difference('Timesheet.count') do
      post :create, timesheet: { confermato: @timesheet.confermato, costo: @timesheet.costo, data: @timesheet.data, fine: @timesheet.fine, inizio: @timesheet.inizio, latitudine: @timesheet.latitudine, location: @timesheet.location, longitudine: @timesheet.longitudine, ore: @timesheet.ore, worker_id: @timesheet.worker_id }
    end

    assert_redirected_to timesheet_path(assigns(:timesheet))
  end

  test "should show timesheet" do
    get :show, id: @timesheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timesheet
    assert_response :success
  end

  test "should update timesheet" do
    patch :update, id: @timesheet, timesheet: { confermato: @timesheet.confermato, costo: @timesheet.costo, data: @timesheet.data, fine: @timesheet.fine, inizio: @timesheet.inizio, latitudine: @timesheet.latitudine, location: @timesheet.location, longitudine: @timesheet.longitudine, ore: @timesheet.ore, worker_id: @timesheet.worker_id }
    assert_redirected_to timesheet_path(assigns(:timesheet))
  end

  test "should destroy timesheet" do
    assert_difference('Timesheet.count', -1) do
      delete :destroy, id: @timesheet
    end

    assert_redirected_to timesheets_path
  end
end
