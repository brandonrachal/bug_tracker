class TesterDevice < ApplicationRecord

	belongs_to :tester
	belongs_to :device
	validates :tester, :device, presence: true
	validates_uniqueness_of :tester_id, :scope => :device_id
	
end