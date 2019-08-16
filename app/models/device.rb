class Device < ApplicationRecord

	has_many :bugs

	validates :description, length: { maximum: 255 }, presence: true

	def self.all_devices
		all.order(description: :asc).map{|e|[e.description, e.id]}
	end
	
end