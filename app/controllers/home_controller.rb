class HomeController < ApplicationController

	def index
		@countries = ['All'] + Tester.all_countries
		@devices = [['All', 'All']] + Device.all_devices
		@testers = search_for_testers
	end

	private

	def search_for_testers
		testers = []
		if params[:search]
			country = params[:search][:country]
			devices = params[:search][:devices]
			country = :all if country == "All"
			devices = :all if devices == ["All"]
			testers = Tester.search(country, devices)
		end
		testers
	end
	
end

