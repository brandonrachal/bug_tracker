require 'test_helper'

class TesterDeviceTest < ActiveSupport::TestCase

	def setup
		@tester = testers(:brandon)
		@device = devices(:galaxy_s10)
		@tester_device = TesterDevice.new(tester: @tester, device: @device)
	end

	test 'should be an instance of TesterDevice' do
		assert_instance_of TesterDevice, @tester_device
	end

	test 'should be valid' do
		assert @tester_device.valid?
	end

	test 'should be invalid if tester blank' do
		@tester_device.tester = nil
		refute @tester_device.valid?, 'is valid with blank tester'
		assert_not_nil @tester_device.errors[:tester], 'no validation for blank tester'
	end

	test 'should be invalid if device blank' do
		@tester_device.device = nil
		refute @tester_device.valid?, 'is valid with blank device'
		assert_not_nil @tester_device.errors[:device], 'no validation for blank device'
	end

end