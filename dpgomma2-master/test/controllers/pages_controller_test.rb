require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get fattura" do
    get :fattura
    assert_response :success
  end

end
