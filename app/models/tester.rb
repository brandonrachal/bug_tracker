class Tester < ApplicationRecord

	validates :first_name, length: { maximum: 60 }, presence: true
	validates :last_name, length: { maximum: 60 }, presence: true
	validates :country, length: { is: 2 }, presence: true

end