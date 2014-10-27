class Rolodex
	attr_reader :contacts #will allow crm to use rolodex
 	@@index = 0
	def initialize
		@contacts = []
	end
	
	def add_contact(contact)
		contact.id = @@index
		@@index += 1000
		@contacts << contact
	end

	def modify_contact(id, attribute, new_value)
		case attribute
		when 1 then @contacts[find_by_index(id)].first_name = new_value
		when 2 then @contacts[find_by_index(id)].last_name = new_value
		when 3 then @contacts[find_by_index(id)].email = new_value
		when 4 then @contacts[find_by_index(id)].note = new_value
		end
	end

	def find_by_index(id)
		@contacts.rindex {|contact| (contact.id == id[0])}
	end

	def display_single(single_index)
		@contacts.each do |contact|
			if single_index == contact.id
				puts "ID: #{contact.id}, Name: #{contact.first_name} Last Name: #{contact.last_name} Email: #{contact.email} Notes: #{contact.note}"
			else
				puts "Does not compute"
			end
		end
	end

	def delete_contact(id_delete)
		@contacts.delete_at (find_by_index(id))
	end

end