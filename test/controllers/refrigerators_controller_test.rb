require 'test_helper'

class RefrigeratorsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get refrigerators_index_url
    assert_response :success
  end
end
