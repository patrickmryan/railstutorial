require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  test "should get home" do
    print "root = " + root_url +  "\n"
    self.get(root_url)
    self.assert_response(:success)
    self.assert_select("title", "Home | #{@base_title}")
  end

  test "should get help" do
    url = static_pages_help_url
    print "help url = " + url +  "\n"
    self.get(url)
    assert_response :success
    self.assert_select("title", "Help | #{@base_title}")
  end

  test "should get about" do
    url = static_pages_about_url
    print "about url = " + url +  "\n"
    self.get(url)    
    #self.get(static_pages_about_url)
    assert_response :success
    self.assert_select("title", "About | #{@base_title}")
  end
  test "should get contact" do
    url = static_pages_contact_url
    print "contact url = " + url +  "\n"
    self.get(url)    
#    self.get(static_pages_contact_url)
    assert_response :success
    self.assert_select("title", "Contact | #{@base_title}")
  end
  
  
end
