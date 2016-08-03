require 'test_helper'

class NewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_news_url
    assert_response :success
  end

  test "should get index" do
    get news_index_url
    assert_response :success
  end


end
