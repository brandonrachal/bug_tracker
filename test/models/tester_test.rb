require 'test_helper'

class TesterTest < ActiveSupport::TestCase

	def setup
		@tester = testers(:brandon)
		@device = devices(:galaxy_s10)
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

	test 'should be invalid with blank country' do
		@tester.country = ''
		refute @tester.valid?, 'is valid with blank country'
		assert_not_nil @tester.errors[:country], 'no validation for blank country'
	end

	test 'should be invalid when country is not 2 chars' do
		['a', 'aaa'].each do |code|
			@tester.country = code
			refute @tester.valid?, 'is valid when country is not 2 chars'
			assert_not_nil @tester.errors[:country], 'no validation for country is not 2 chars'
		end
	end

	test 'should have_many devices' do
		assert @tester.save
		assert @device.save
		@tester.devices << @device
		assert_equal @tester.devices.first, @device
	end

	test 'should throw ActiveRecord::RecordInvalid when duplicate devices' do
		assert @tester.save
		assert @device.save
		@tester.devices << @device
		assert_raises ActiveRecord::RecordInvalid do
			@tester.devices << @device
		end
	end

	test 'should have_many bugs' do
		assert @tester.save
		assert @device.save
		bug = Bug.new(device: @device)
		@tester.bugs << bug
		assert_equal @tester.bugs.first, bug
	end

	test 'all_countries should return all uniq countries' do
		@tester.save
		dinorah = testers(:dinorah)
		taichi = testers(:taichi)
		oliver = testers(:oliver)
		dinorah.save
		taichi.save
		oliver.save
		result = Tester.all_countries
		assert_equal result.length, 3
	end


end