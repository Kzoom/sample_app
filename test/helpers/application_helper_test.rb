require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

def setup
  	@base_title = "Ruby on Rails Tutorial Sample_App"
end

test "full title helper" do
		assert_equal full_title, "#{@base_title}"
		assert_equal full_title("Help"), "Help | #{@base_title}"	
	end
end

#def full_title(page_title = '')
#		base_title = "Ruby on Rails Tutorial Sample_App"
#		if page_title.empty?
#			base_title
#		else
#			"#{page_title} | #{base_title}"
#		end
#	end