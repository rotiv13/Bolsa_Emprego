require 'test_helper'

class EntitieControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get entitie_new_url
    assert_response :success
  end

end
