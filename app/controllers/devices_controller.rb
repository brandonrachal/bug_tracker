class DevicesController < ApplicationController

	def index
		@devices = Device.all_with_bug_count
	end

end