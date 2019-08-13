class TesterDevice < ApplicationRecord

	belongs_to :tester
	belongs_to :device
	validates :tester, :device, presence: true
	
end