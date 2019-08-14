class Tester < ApplicationRecord

	has_many :tester_devices
	has_many :devices, through: :tester_devices
	has_many :bugs

	validates :first_name, length: { maximum: 60 }, presence: true
	validates :last_name, length: { maximum: 60 }, presence: true
	validates :country, length: { is: 2 }, presence: true

	def self.all_countries
		select(:country).order(:country).distinct.map(&:country)
	end

	def self.search(country, devices)
		return [] if country.nil? && devices.nil?
		query = select('testers.*, count(*) as bug_count').group('testers.id').joins(:bugs).order('bug_count desc')
		query = query.where(country: country) if !country.blank? && country != 'All'
		query = query.where(bugs: { device_id: devices }) if !devices.blank? && devices != ['All']
		query
	end

end