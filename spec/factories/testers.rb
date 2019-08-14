FactoryBot.define do

	factory :tester do
		first_name { 'Test' }
		last_name { 'User' }
		country { 'US' }

		factory :brandon do
	    first_name { 'Brandon' }
			last_name { 'Rachal' }
			country { 'US' }
	  end

	  factory :dinorah do
	    first_name { 'Dinora' }
			last_name { 'Cavazos' }
			country { 'MX' }
	  end

	  factory :taichi do
	    first_name { 'Taichi' }
			last_name { 'Daruma' }
			country { 'JP' }
	  end

	  factory :oliver do
	    first_name { 'Oliver' }
			last_name { 'Quistgard' }
			country { 'US' }
	  end

	  trait :with_devices do
			after :create do |tester|
				tester.devices << FactoryBot.create(:galaxy_s10)
				tester.devices << FactoryBot.create(:htc_one)
				tester.devices << FactoryBot.create(:iphone_5)
			end
		end

		trait :with_bugs do
			after :create do |tester|
				tester.bugs << FactoryBot.create(:bug_galaxy_s10)
				tester.bugs << FactoryBot.create(:bug_galaxy_s10)
				tester.bugs << FactoryBot.create(:bug_htc_one)
				tester.bugs << FactoryBot.create(:bug_iphone_5)
			end
		end

	end

end
