require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  def setup
    @user = users(:archer)
    # This code is not idiomatically correct.
    @offer = @user.offers.build(title:"titles", description: "contentsa",
                       date_begin: "12-12-22", date_end: "12-12-42",
                       active: true, prof_area: "prof_area", locality: @user.locality, user_id:@user.id)
  end



  test "should be valid" do
    assert @offer.valid?
  end


  test "user id should be present" do
    @offer.user_id = nil
    assert_not @offer.valid?
  end

  test "title should be present" do
    @offer.title = "   "
    assert_not @offer.valid?
  end

  test "description should be present" do
    @offer.description = "   "
    assert_not @offer.valid?
  end


  test "date_degin should be present" do
    @offer.date_begin = "   "
    assert_not @offer.valid?
  end

  test "date_end should be present" do
    @offer.date_end = "   "
    assert_not @offer.valid?
  end

  test "prof_area should be present" do
    @offer.prof_area = "   "
    assert_not @offer.valid?
  end



end
