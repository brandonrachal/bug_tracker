class AddBugTrackerTables < ActiveRecord::Migration[5.2]
  def change
  	create_table :testers do |t|
  		t.string :first_name, limit: 60
  		t.string :last_name, limit: 60
  		t.string :country, limit: 2
  		t.datetime :last_login
  	end

  	create_table :devices do |t|
  		t.string :description
  	end

  	create_table :bugs do |t|
  		t.belongs_to :tester, index: true
  		t.belongs_to :device, index: true
  	end

  	create_table :tester_devices do |t|
  		t.belongs_to :tester, index: true
  		t.belongs_to :device, index: true
  	end
  end
end
