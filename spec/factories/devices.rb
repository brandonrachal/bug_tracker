FactoryBot.define do

	factory :device do
		description { 'Device Description' }

		factory :galaxy_s10 do
			description { 'Galaxy S10' }
		end

		factory :htc_one do
			description { 'HTC One' }
		end

		factory :iphone_5 do
			description { 'iPhone 5' }
		end
	end

end