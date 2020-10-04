require 'test_helper'

class AddLatitudeLongitudeToTimesheetsControllerTest < ActionController::TestCase
  setup do
    @add_latitude_longitude_to_timesheet = add_latitude_longitude_to_timesheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:add_latitude_longitude_to_timesheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create add_latitude_longitude_to_timesheet" do
    assert_difference('AddLatitudeLongitudeToTimesheet.count') do
      post :create, add_latitude_longitude_to_timesheet: { latitudine_fine: @add_latitude_longitude_to_timesheet.latitudine_fine, longitudine_fine: @add_latitude_longitude_to_timesheet.longitudine_fine }
    end

    assert_redirected_to add_latitude_longitude_to_timesheet_path(assigns(:add_latitude_longitude_to_timesheet))
  end

  test "should show add_latitude_longitude_to_timesheet" do
    get :show, id: @add_latitude_longitude_to_timesheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @add_latitude_longitude_to_timesheet
    assert_response :success
  end

  test "should update add_latitude_longitude_to_timesheet" do
    patch :update, id: @add_latitude_longitude_to_timesheet, add_latitude_longitude_to_timesheet: { latitudine_fine: @add_latitude_longitude_to_timesheet.latitudine_fine, longitudine_fine: @add_latitude_longitude_to_timesheet.longitudine_fine }
    assert_redirected_to add_latitude_longitude_to_timesheet_path(assigns(:add_latitude_longitude_to_timesheet))
  end

  test "should destroy add_latitude_longitude_to_timesheet" do
    assert_difference('AddLatitudeLongitudeToTimesheet.count', -1) do
      delete :destroy, id: @add_latitude_longitude_to_timesheet
    end

    assert_redirected_to add_latitude_longitude_to_timesheets_path
  end
end
