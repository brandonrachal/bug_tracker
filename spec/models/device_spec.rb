require "rails_helper"

describe Device do

	let(:device) { build(:device) }

	it 'has a valid factory' do
		expect(device).to be_valid
	end

end