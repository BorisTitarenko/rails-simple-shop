require 'test_helper'

class InstrumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get instruments_index_url
    assert_response :success
  end

  test "should get new" do
    get instruments_new_url
    assert_response :success
  end

end
