require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end


  test "invalid signup information" do
    get signup_path
    assert_response :success
    get new_candidate_path
    assert_response :success
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {name: 'BackOffice',
                                        email: 'bakcoffsice@bolsaemprego.com',
                                        password:              'admin123',
                                        password_confirmation: 'admin123',
                                        entitie: 0,
                                        address: 'Bolsa de Emprego',
                                        postal_code: '4050',
                                        locality: 'Porto',
                                        phone: '123456789',
                                        cellphone: '123456789',
                                        page: 'bolsaemprego.com',
                                        birth_date: Time.zone.now,
                                        idnum: '123456789',
                                        prof_area: 'Admin',
                                        presentation: 'Administrador do Website Bolsa de Emprego',
                                        activated: true,
                                        activated_at: Time.zone.now,
                                        admin: true} }
    end
    follow_redirect!
    assert_template '/'
  end

  test "valid signup information with account activation" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    # Try to log in before activation.
    log_in_as(user)
    assert_not is_logged_in?
    # Invalid activation token
    get edit_account_activation_path("invalid token", email: user.email)
    assert_not is_logged_in?
    # Valid token, wrong email
    get edit_account_activation_path(user.activation_token, email: 'wrong')
    assert_not is_logged_in?
    # Valid activation token
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

end
