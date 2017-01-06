require 'test_helper'

class LettersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get new_letter_url
    assert_response :success
  end

end
