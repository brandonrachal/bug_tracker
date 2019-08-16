class Device < ApplicationRecord

	has_many :bugs

	validates :description, length: { maximum: 255 }, presence: true

	def self.all_devices
		all.order(description: :asc).map{|e|[e.description, e.id]}
	end

	def self.all_with_bug_count
		select('devices.*, count(bugs.id) as bug_count').
			group('devices.id').
			left_joins(:bugs).
			order('devices.description')
	end
	
end