require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test 'creating a message' do
    assert_difference 'Message.count' do
      post '/messages', params: {
        message: {
          user_token: 'abc123',
          user_name: 'Trogdor',
          body: 'Hello, world!'
        }
      }
    end

    assert_response :created
  end
end
