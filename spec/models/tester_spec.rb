require "rails_helper"

describe Tester do

	let(:tester) { build(:tester) }

	it 'has a valid factory' do
		expect(tester).to be_valid
	end

	it ".new returns an instance of Tester" do
	  expect(Tester.new).to be_an_instance_of Tester
	end

	it '#save returns true' do
		expect(tester.save).to eq true
	end

	describe '#first_name' do
		it 'is invalid if first_name not present' do
			tester.first_name = nil
			expect(tester).to_not be_valid
		end

		it 'is invalid if first_name is blank' do
			tester.first_name = ""
			expect(tester).to_not be_valid
		end

		it 'is invalid if first_name length over 60' do
			tester.first_name = 'a' * 61
			expect(tester).to_not be_valid
		end
	end

	describe '#last_name' do
		it 'is invalid if last_name not present' do
			tester.last_name = nil
			expect(tester).to_not be_valid
		end

		it 'is invalid if last_name is blank' do
			tester.last_name = ""
			expect(tester).to_not be_valid
		end

		it 'is invalid if last_name length over 60' do
			tester.last_name = 'a' * 61
			expect(tester).to_not be_valid
		end
	end

	describe '#country' do
		it 'is invalid if country not present' do
			tester.country = nil
			expect(tester).to_not be_valid
		end

		it 'is invalid if country is blank' do
			tester.country = ""
			expect(tester).to_not be_valid
		end

		it 'is invalid if country length is not 2' do
			tester.country = 'a'
			expect(tester).to_not be_valid
		end
	end
	
	describe '#devices' do
		let!(:tester) { create(:tester, :with_devices) }

		it 'should return a Device' do
			expect(tester.devices.first).to be_an_instance_of Device
		end

		it 'should return many Devices' do
			expect(tester.devices.count).to eq 3
		end

		it 'should throw ActiveRecord::RecordInvalid when duplicate devices' do
			assert_raises ActiveRecord::RecordInvalid do
				tester.devices << tester.devices.first
			end
		end
	end

	describe '#bugs' do
		let!(:tester) { create(:tester, :with_bugs) }

		it 'should return a Bug' do
			expect(tester.bugs.first).to be_an_instance_of Bug
		end

		it 'should return many Bugs' do
			expect(tester.bugs.count).to eq 4
		end
	end

	it '.all_countries should return all uniq countries' do
		create(:brandon)
		create(:oliver)
		create(:dinorah)
		create(:taichi)
		expect(Tester.all_countries).to eq ['JP', 'MX', 'US']
	end

	describe '.search' do
		let!(:galaxy_s10) { create(:galaxy_s10) }
		let!(:htc_one) { create(:htc_one) }
		let!(:iphone_5) { create(:iphone_5) }

		let!(:brandon) do
			tester = create(:brandon)
			FactoryBot.create(:bug, device: galaxy_s10, tester: tester)
			FactoryBot.create(:bug, device: galaxy_s10, tester: tester)
			FactoryBot.create(:bug, device: htc_one, tester: tester)
			FactoryBot.create(:bug, device: iphone_5, tester: tester)
			tester
		end

		let!(:dinorah) do
			tester = create(:dinorah)
			FactoryBot.create(:bug, device: galaxy_s10, tester: tester)
			FactoryBot.create(:bug, device: htc_one, tester: tester)
			tester
		end

		let!(:oliver) do
			tester = create(:oliver)
			FactoryBot.create(:bug, device: galaxy_s10, tester: tester)
			FactoryBot.create(:bug, device: iphone_5, tester: tester)
			tester
		end

		let!(:taichi) do
			tester = create(:taichi)
			FactoryBot.create(:bug, device: iphone_5, tester: tester)
			tester
		end

		let!(:tester) { create(:tester) }

		it 'should return Testers by bug counts desc' do
			testers = [brandon, dinorah, oliver, taichi, tester]
			results = Tester.search(:all, :all)
			expect(results.map(&:id)).to eq testers.map(&:id)
			expect(results.map(&:bug_count)).to eq [4, 2, 2, 1, 0]
		end

		it 'should return Testers with country code US' do
			testers = [brandon, oliver, tester]
			results = Tester.search('US', :all)
			expect(results.map(&:id)).to eq testers.map(&:id)
			expect(results.map(&:bug_count)).to eq [4, 2, 0]
			expect(results.map(&:country)).to eq ['US', 'US', 'US']
		end

		it 'should return 1 Tester with country code JP and iPhone 5 bug' do
			testers = [taichi]
			results = Tester.search('JP', [iphone_5.id])
			expect(results.map(&:id)).to eq testers.map(&:id)
			expect(results.map(&:bug_count)).to eq [1]
			expect(results.map(&:country)).to eq ['JP']
		end

		it 'should return 0 Testers with country code JP and Galaxy S10 bug' do
			results = Tester.search('JP', [galaxy_s10.id])
			expect(results.length).to eq 0
		end
	end

end
