require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  def setup
    @app_title = "EasyShare"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "#{@app_title}"
  end

  test "should get top" do
    get "/"
    assert_response :success
    assert_select "title", "#{@app_title}"
  end

end
