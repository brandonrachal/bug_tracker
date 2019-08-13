require 'test_helper'

class DeviceTest < ActiveSupport::TestCase

	test 'should be an instance of Device' do
		assert_instance_of Device, Device.new
	end

end