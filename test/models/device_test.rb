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

	test 'all_devices should return an array of arrays' do
		@device.save
		htc = devices(:htc_one)
		iphone = devices(:iphone_5)
		htc.save
		iphone.save
		result = Device.all_devices
		assert_equal result, [['Galaxy S10', 1], ['HTC One', 2], ['iPhone 5', 3]]
	end

end