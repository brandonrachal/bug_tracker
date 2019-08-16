require "rails_helper"

describe Bug do

	let(:bug) { build(:bug) }

	it 'has a valid factory' do
		expect(bug).to be_valid
	end

	it ".new returns an instance of Bug" do
	  expect(Bug.new).to be_an_instance_of Bug
	end

	it '#save returns true' do
		expect(bug.save).to eq true
	end

	describe '#tester' do
		it "should return an instance of Tester" do
		  expect(bug.tester).to be_an_instance_of Tester
		end

		it 'should be invalid if tester blank' do
			bug.tester = nil
			expect(bug).to_not be_valid
		end
	end

	describe '#device' do
		it "should return an instance of Device" do
		  expect(bug.device).to be_an_instance_of Device
		end

		it 'should be invalid if device blank' do
			bug.device = nil
			expect(bug).to_not be_valid
		end
	end

end