class Tester < ApplicationRecord

	has_many :tester_devices
	has_many :devices, through: :tester_devices
	has_many :bugs

	validates :first_name, length: { maximum: 60 }, presence: true
	validates :last_name, length: { maximum: 60 }, presence: true
	validates :country, length: { is: 2 }, presence: true

	def name
		"#{first_name} #{last_name}"
	end

end