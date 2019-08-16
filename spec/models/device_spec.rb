require "rails_helper"

describe Device do

	let(:device) { build(:device) }

	it 'has a valid factory' do
		expect(device).to be_valid
	end

	it '#save returns true' do
		expect(device.save).to eq true
	end

	describe '#bugs' do
		let!(:device) { create(:device, :with_bugs) }

		it 'should return a Bug' do
			expect(device.bugs.first).to be_an_instance_of Bug
		end

		it 'should return many Bugs' do
			expect(device.bugs.length).to eq 2
		end
	end

end