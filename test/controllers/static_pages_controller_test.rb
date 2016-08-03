require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Bolsa de Emprego"
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Ajuda | #{@base_title}"

  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "Sobre nós | #{@base_title}"

  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_select "title", "Contactos | #{@base_title}"

  end

end
