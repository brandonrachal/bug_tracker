require 'test_helper'

class DeviceTest < ActiveSupport::TestCase

	def setup
		@device = devices(:galaxy_s10)
	end

	test 'should be an instance of Device' do
		assert_instance_of Device, @device
	end

	test 'should be valid' do
		assert @device.valid?
	end

	test 'should be invalid with a blank description' do
		@device.description = ''
		refute @device.valid?, 'is valid with a blank description'
		assert_not_nil @device.errors[:description], 'no validation for blank description'
	end

	test 'should be invalid with a description over 255 chars' do
		@device.description = 'a' * 256
		refute @device.valid?, 'is valid with description over 255 chars'
		assert_not_nil @device.errors[:description], 'no validation for description over 255 chars'
	end

end