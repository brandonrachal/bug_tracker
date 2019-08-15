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
		expect(Tester.all_countries).to eq ['JP', 'MX', 'US']
	end

	describe '.search' do
		it 'should return Testers by bug counts desc' do
			one = create(:tester, :with_bugs)
			two = create(:tester)
			two.bugs << FactoryBot.create(:bug_galaxy_s10)
			two.bugs << FactoryBot.create(:bug_htc_one)
			three = create(:tester)
			three.bugs << FactoryBot.create(:bug_iphone_5)
			ids = Tester.search('', []).map(&:id)
			expect(ids).to eq [one.id, two.id, three.id]
			bug_counts = Tester.search('', []).map(&:bug_count)
			expect(bug_counts).to eq [4, 2, 1]
		end

		it 'should return Testers from the US' do
			one = create(:tester, :with_bugs)
			two = create(:dinorah)
			two.bugs << FactoryBot.create(:bug_galaxy_s10)
			two.bugs << FactoryBot.create(:bug_htc_one)
			three = create(:oliver)
			three.bugs << FactoryBot.create(:bug_iphone_5)
			ids = Tester.search('US', []).map(&:id)
			expect(ids).to eq [one.id, three.id]
		end

	end

end
