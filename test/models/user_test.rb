require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without password digest' do
    user = User.new(username: 'Test User', password: 'password')
    user.password_digest = nil
    assert_not user.save, 'Saved the user without a password digest'
  end

  test 'should save user with valid attributes' do
    user = User.new(username: 'Test User', password: 'password')
    assert user.save, 'Could not save user with valid attributes'
  end
end