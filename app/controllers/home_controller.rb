class HomeController < ApplicationController

	def index
		@countries = Tester.all_countries
		@devices = Device.all_devices
		@testers = Tester.search(params[:country], params[:devices])
	end
	
end