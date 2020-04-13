require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test 'getting index' do
    get '/messages'

    expected_response = {
      messages: [
        {
          user_token: 'alexp',
          user_name: 'profeit',
          body: 'Yo'
        },
        {
          user_token: 'leesr',
          user_name: 'lees',
          body: 'hello'
        }
      ]
    }.to_json

    assert_response 200
    parsed_response = JSON.parse(@response.body)
    JSON.parse(@response.body).each_with_index do |message, i|
      ['user_token', 'user_name', 'body'].each do |field|
        assert_equal expected_response[i][field.to_s], parsed_response[field.to_s]
      end
    end
  end

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
