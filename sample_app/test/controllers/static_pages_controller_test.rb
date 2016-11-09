require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    self.get(static_pages_home_url)
    self.assert_response(:success)
    self.assert_select("title", "Home | Ruby on Rails Tutorial Sample App")
  end

  test "should get help" do
    self.get(static_pages_help_url)
    assert_response :success
    self.assert_select("title", "Help | Ruby on Rails Tutorial Sample App")
  end

  test "should get about" do
    self.get(static_pages_about_url)
    assert_response :success
    self.assert_select("title", "About | Ruby on Rails Tutorial Sample App")
  end
  
end
