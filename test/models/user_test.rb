require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'BackOffice',
                     email: 'bakcoffice@sbolsaemprego.com',
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
                     admin: true
    )
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end


  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.offers.create!(title:"titles", description: "contentsa",
                         date_begin: "12-12-22", date_end: "12-12-42",
                         active: true, prof_area: "prof_area", locality: @user.locality, user_id:@user.id)
    assert_difference 'Offer.count', -1 do
      @user.destroy
    end
  end

end
