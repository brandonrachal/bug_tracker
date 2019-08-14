require "rails_helper"

describe TesterDevice do

	let(:tester_device) { build(:tester_device) }

	it 'has a valid factory' do
		expect(tester_device).to be_valid
	end

	it ".new returns an instance of TesterDevice" do
	  expect(TesterDevice.new).to be_an_instance_of TesterDevice
	end

	it '#save returns true' do
		expect(tester_device.save).to eq true
	end

	describe '#tester' do
		it 'should be invalid if tester blank' do
			tester_device.tester = nil
			expect(tester_device).to_not be_valid
		end
	end

	describe '#device' do
		it 'should be invalid if device blank' do
			tester_device.device = nil
			expect(tester_device).to_not be_valid
		end
	end

end