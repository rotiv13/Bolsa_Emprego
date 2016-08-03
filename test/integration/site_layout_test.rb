require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest


  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", news_index_path
    assert_select "a[href=?]", offers_path
    assert_select "a[href=?]", index_candidate_path
    assert_select "a[href=?]", index_entitie_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", login_path



  end
end
