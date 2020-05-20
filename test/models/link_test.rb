require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  fixtures :links

  test "url should be present" do
    links(:one).url = ""
    assert_not links(:one).valid?
    assert_equal ["Url can't be blank"], links(:one).errors.full_messages
  end

  test "slug should be present" do
    links(:one).slug = " " * 8
    assert_not links(:one).valid?
    assert_equal ["Slug can't be blank"], links(:one).errors.full_messages
  end

  test "slug should have length of 8" do
    links(:one).slug = "hello"
    assert_not links(:one).valid?
    assert_equal ["Slug is the wrong length (should be 8 characters)"], links(:one).errors.full_messages
  end

  test "slug should be unique" do
    link1 = links(:one)
    link2 = Link.new(url: "https://test_url.com/slug", slug: link1.slug)
    assert_not link2.valid?
    assert_equal ["Slug has already been taken"], link2.errors.full_messages
  end

  test "url should be unique" do
    link1 = links(:one)
    link2 = Link.new(url: link1.url, slug: "qwertyui")
    assert_not link2.valid?
    assert_equal ["Url has already been taken"], link2.errors.full_messages
  end

  test "pinned should include either true or false" do
    links(:one).pinned = nil
    assert_not links(:one).valid?
    assert_equal ["Pinned is not included in the list"], links(:one).errors.full_messages
  end

  test "clicked should be present" do
    links(:one).clicked = ""
    assert_not links(:one).valid?
    assert_equal ["Clicked can't be blank", "Clicked is not a number"], links(:one).errors.full_messages
  end

  test "clicked should be of integer type" do
    links(:one).clicked = 5.2
    assert_not links(:one).valid?
    assert_equal ["Clicked must be an integer"], links(:one).errors.full_messages
  end
end
