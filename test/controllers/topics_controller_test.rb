require 'test_helper'

class TopicsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get '/topics'
    assert_equal 200, response.body
  end
end
