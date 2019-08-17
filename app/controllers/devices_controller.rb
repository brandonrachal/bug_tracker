class DevicesController < ApplicationController

	def index
		@devices = Device.all_with_bug_count
	end

	def show
		@device = Device.find(params[:id])
	end

end