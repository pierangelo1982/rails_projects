require 'test_helper'

require 'net/http'
require 'open-uri'
require 'json'

include WelcomeHelper



class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get welcome_home_url
    assert_response :success
  end

  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  test "should get detail" do
    get welcome_detail_url
    assert_response :success
  end

  test "check connection" do
    tmp_url = "http://api.openweathermap.org/data/2.5/forecast?id=524901&appid="
    tmp_key = ENV["OPENWEATHERMAP_API_KEY"]
    url = "#{tmp_url}#{tmp_key}"
    result = JSON.parse(open(url).read)
    assert true
  end

  test "read json" do
    tmp_url = "http://api.openweathermap.org/data/2.5/forecast?id=524901&appid="
    tmp_key = ENV["OPENWEATHERMAP_API_KEY"]
    url = "#{tmp_url}#{tmp_key}"
    result = JSON.parse(open(url).read)
    assert_equal(result['cod'], "200", "ok")
  end


  test "get json detail" do
    tmp_url = "http://api.openweathermap.org/data/2.5/forecast?id=524901&appid="
    tmp_key = ENV["OPENWEATHERMAP_API_KEY"]
    url = "#{tmp_url}#{tmp_key}"
    result = JSON.parse(open(url).read)
    assert_equal(result['cod'], "200", "ok")
  end

end
