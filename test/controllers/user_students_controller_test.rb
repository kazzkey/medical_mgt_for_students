require 'test_helper'

class UserStudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_students_show_url
    assert_response :success
  end

end
