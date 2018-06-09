require 'test_helper'

class StudyControllerTest < ActionDispatch::IntegrationTest
  test "should get center" do
    get study_center_url
    assert_response :success
  end

end
