require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get couple_profile" do
    get profiles_couple_profile_url
    assert_response :success
  end

end
