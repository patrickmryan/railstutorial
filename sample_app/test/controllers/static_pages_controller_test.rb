require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    #self.get(static_pages_home_url)
    self.get(:home)
    self.assert_response(:success)
    self.assert_select("title", "Ruby on Rails Tutorial Sample App")
  end

  test "should get help" do
    self.get(:help)
    #get :help
    assert_response :success
    self.assert_select("title", "Help | Ruby on Rails Tutorial Sample App")
  end

  test "should get about" do
    self.get(:about)
    #get :about
    assert_response :success
    self.assert_select("title", "About | Ruby on Rails Tutorial Sample App")
  end
  
end
