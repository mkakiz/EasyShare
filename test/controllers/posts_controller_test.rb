require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get post" do
    post "/login", params: {
      email: 'testuser@example.com',
      password: '123456',
    }
    get "/posts/index"
    get "/posts/new"
    get "/users/index"
    assert_response :success
  end
end
