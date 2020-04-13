require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'a token is created when a user is created' do
    user = User.create!

    assert_equal SecureRandom.hex.size, user.token.size
  end
end
