require 'test_helper'

class BugTest < ActiveSupport::TestCase

	def setup
		@tester = testers(:brandon)
		@device = devices(:galaxy_s10)
		@bug = Bug.new(tester: @tester, device: @device)
	end

	test 'should be an instance of Bug' do
		assert_instance_of Bug, @bug
	end

	test 'should be valid' do
		assert @bug.valid?
	end

	test 'should be invalid if tester blank' do
		@bug.tester = nil
		refute @bug.valid?, 'is valid with blank tester'
		assert_not_nil @bug.errors[:tester], 'no validation for blank tester'
	end

	test 'should be invalid if device blank' do
		@bug.device = nil
		refute @bug.valid?, 'is valid with blank device'
		assert_not_nil @bug.errors[:device], 'no validation for blank device'
	end

end