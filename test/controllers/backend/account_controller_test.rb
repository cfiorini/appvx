require 'test_helper'

class Backend::AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backend_account_index_url
    assert_response :success
  end

  test "should get buy" do
    get backend_account_buy_url
    assert_response :success
  end

end
