require 'test_helper'

class OffersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:archer)
    @offer = Offer.new(title:"titles", description: "contentsa",
                       date_begin: "12-12-22", date_end: "12-12-42",
                       active: true, prof_area: "prof_area", locality: @user.locality, user_id:@user.id)
  end

  test "should get index" do
    get offers_url
    assert_response :success
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Offer.count' do
      post offers_url, params: { offer: {title:"titlses", description: "contesntsa",
                                         date_begin: "12-122-22", date_end: "12-122-42",
                                         active: true, prof_area: "prof_saarea", locality: @user.locality,  user_id: @user.id} }
    end
    assert_redirected_to login_url
  end

end
