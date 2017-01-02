require 'test_helper'

class LettersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get letters_new_url
    assert_response :success
  end

end
