require 'test_helper'

class TesterDeviceTest < ActiveSupport::TestCase

	test 'should be an instance of TesterDevice' do
		assert_instance_of TesterDevice, TesterDevice.new
	end

end