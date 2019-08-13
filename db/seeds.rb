require 'csv'

load_files = ['testers.csv', 'devices.csv', 'bugs.csv', 'tester_device.csv']
load_files.each do |file_name|
	csv_path = File.join(__dir__, file_name)
	klass_name = File.basename(file_name, ".*").classify
	klass = klass_name.constantize
	id_name = "#{klass_name.underscore}_id"
	CSV.foreach(csv_path, :headers => true) do |row|
		row_id, row_data = nil, {}
	  row.each do |key, value|
	  	rails_key = key.underscore
	  	if rails_key == id_name
	  		row_id = value
	  	else
	  		row_data[rails_key] = value
	  	end
	  end
	  new_record = klass.new(row_data)
	  new_record.id = row_id if row_id
	 	new_record.save!
	end
end