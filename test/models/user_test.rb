require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "admin is a user" do
    user = User.try_to_login('admin','admin')
    assert user, 'admin user is absent'
  end

  test "admin is administrator" do
    user = User.try_to_login('admin','admin')
    assert user.admin, 'admin user is not administrator'
  end

  test "pba is not administrator" do
    user = User.try_to_login('pba','pba')
    assert_not user.admin, 'pba must not be an administrator'
  end

  test "check right password" do
    user = User.try_to_login('pba','pba')
    assert user
  end

  test "check wrong password" do
    user = User.try_to_login('pba','password')
    assert_not user
  end

  test "user is logged on" do
    user = User.try_to_login('pba','pba')
    assert User.current
    assert (User.current.login == 'pba')
    assert user.logged?
  end
  
  test "locked user" do
    user = User.find_by(login: 'lock')
    assert user.locked?
    user = User.try_to_login('lock','')
    assert_not user
  end
  

end
