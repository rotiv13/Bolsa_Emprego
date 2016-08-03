require 'test_helper'

class OfferRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "create should require logged-in user" do
    assert_no_difference 'OfferRelationship.count' do
      post relationships_path
    end
    assert_redirected_to login_url
  end

  test "destroy should require logged-in user" do
    assert_no_difference 'OfferRelationship.count' do
      delete relationship_path(offer_relationships(:one))
    end
    assert_redirected_to login_url

  end
end