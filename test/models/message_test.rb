require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "can't create a message using a previously used user name" do
    assert_difference('Message.count') do
      Message.create!(body: "Hello", user_token: "abc123", user_name: "Alex")
    end

    assert_no_difference('Message.count') do
      Message.create(body: "Hello!", user_token: "abc123", user_name: "Alex")
    end
  end
end
