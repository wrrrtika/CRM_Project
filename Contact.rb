class Contact
	attr_accessor :id, :first_name, :last_name, :email, :note
   
	def initialize (first_name, last_name, email, note)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@note = note	
	end

	def valid?
		instance_variables.each do |key|
			value = instance_variable_get(key)
			if value == nil
				puts "please add the value for #{key}"
				return false
			end
		end
		return true
	end

	def display_values
		instance_variables.each do |key|
			value = instance_variable_get(key)
			pretty_key = key.to_s 
			puts "#{pretty_key}: #{value}"
		end
	end
end