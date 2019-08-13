require 'test_helper'

class TesterTest < ActiveSupport::TestCase

	def setup
		@tester = testers(:brandon)
	end

	test 'should be an instance of Tester' do
		assert_instance_of Tester, @tester
	end

	test 'should be valid' do
		assert @tester.valid?
	end

	test 'should be invalid with blank first_name' do
		@tester.first_name = ''
		refute @tester.valid?, 'is valid with blank first_name'
		assert_not_nil @tester.errors[:first_name], 'no validation for blank first_name'
	end

	test 'should be invalid with first_name over 60 chars' do
		@tester.first_name = 'a' * 61
		refute @tester.valid?, 'is valid with first_name over 60 chars'
		assert_not_nil @tester.errors[:first_name], 'no validation for first_name over 60 chars'
	end

	test 'should be invalid with blank last_name' do
		@tester.last_name = ''
		refute @tester.valid?, 'is valid with blank last_name'
		assert_not_nil @tester.errors[:last_name], 'no validation for blank last_name'
	end

	test 'should be invalid with last_name over 60 chars' do
		@tester.last_name = 'a' * 61
		refute @tester.valid?, 'is valid with last_name over 60 chars'
		assert_not_nil @tester.errors[:last_name], 'no validation for last_name over 60 chars'
	end

end