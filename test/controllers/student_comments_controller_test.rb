require 'test_helper'

class StudentCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get student_comments_create_url
    assert_response :success
  end

end
