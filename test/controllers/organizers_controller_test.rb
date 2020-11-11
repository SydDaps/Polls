require 'test_helper'

class OrganizersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get organizers_new_url
    assert_response :success
  end

  test "should get create" do
    get organizers_create_url
    assert_response :success
  end

end
