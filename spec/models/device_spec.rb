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

	describe '.all_with_bug_count' do
		let!(:galaxy_s10) { create(:galaxy_s10) }
		let!(:htc_one) { create(:htc_one) }
		let!(:iphone_5) { create(:iphone_5) }

		let!(:brandon) do
			tester = create(:brandon)
			FactoryBot.create(:bug, device: galaxy_s10, tester: tester)
			FactoryBot.create(:bug, device: galaxy_s10, tester: tester)
			FactoryBot.create(:bug, device: htc_one, tester: tester)
			tester
		end

		it 'should return Devices by bug counts desc' do
			devices = [galaxy_s10, htc_one, iphone_5]
			results = Device.all_with_bug_count
			expect(results.first).to be_an_instance_of Device
			expect(results.map(&:id)).to eq devices.map(&:id)
			expect(results.map(&:bug_count)).to eq [2, 1, 0]
		end

	end

end