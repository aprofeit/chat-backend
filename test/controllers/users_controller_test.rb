require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'get me' do
    get '/me'

    expected_response = {
      user: {
        token: 'somefaketoken'
      }
    }.to_json

    assert_response 201
    assert_equal expected_response, JSON.parse(@response.body)

    get '/me', params: { token: 'somefaketoken' }

    expected_response = {
      user: {
        user_name: "Alex"
      }
    }.to_json

    assert_response 200
    asset_equal expected_response, JSON.parse(@response.body)


  end
end
