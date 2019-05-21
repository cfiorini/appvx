require 'test_helper'

class Backend::PopMapControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backend_pop_map_index_url
    assert_response :success
  end

  test "should get edit" do
    get backend_pop_map_edit_url
    assert_response :success
  end

end
