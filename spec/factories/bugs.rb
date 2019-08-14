FactoryBot.define do

	factory :bug do
		device
		tester

		factory :bug_galaxy_s10 do
			association :device, factory: :galaxy_s10
		end

		factory :bug_htc_one do
			association :device, factory: :htc_one
		end

		factory :bug_iphone_5 do
			association :device, factory: :iphone_5
		end

	end

end