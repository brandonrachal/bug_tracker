require 'test_helper'

class BugTest < ActiveSupport::TestCase

	test 'should be an instance of Bug' do
		assert_instance_of Bug, Bug.new
	end

end