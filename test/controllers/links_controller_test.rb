require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  fixtures :links

  test "should create new url with slug" do
    post links_path, params: {link: { url: "https://testurl.com" } }
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal true, json_response["success"]
  end

  test "should get show" do
    get link_path(links(:one).slug)
    assert_response :success
  end
end
