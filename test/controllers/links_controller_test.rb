require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  fixtures :links

  test "should create new url with slug" do
    status_code = post links_path, params: {link: { url: "https://testurl.com" } }
    assert_response :success
  end

  test "should get show" do
    get "#{link_path(links(:one).slug)}.json"
    assert_response :success
  end

  test "should get index and return correct response" do
    get links_path
    assert_response :success
  end

  test "should update and return correct response" do
    patch link_path(links(:one).slug), params: { link: { pinned: true } }
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal true, json_response["links"][0]["pinned"]
  end
end
