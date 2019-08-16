class TesterDevice < ApplicationRecord

	belongs_to :tester
	belongs_to :device
	validates :tester, :device, presence: true
	validates_uniqueness_of :device_id, :scope => :tester_id
	
end