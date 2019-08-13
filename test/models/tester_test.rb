require 'test_helper'

class TesterTest < ActiveSupport::TestCase

	test 'should be an instance of Tester' do
		assert_instance_of Tester, Tester.new
	end

end