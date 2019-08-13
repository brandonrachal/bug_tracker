class Device < ApplicationRecord

	validates :description, length: { maximum: 255 }, presence: true
	
end