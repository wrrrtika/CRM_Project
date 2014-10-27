require_relative './contact.rb'
require_relative './rolodex.rb'

class Crm
	attr_reader :name 
	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end

	def main_menu
		puts "Welcome to #{@name}"
		while true 
		print_main_menu
		user_input = gets.chomp.to_i
		if user_input == 7
			puts "Goodbye!"
		end
		choose_option(user_input)
	end
end

	def print_main_menu
		puts " [1] Add a contact"
		puts " [2] Modify an existing contact"
		puts " [3] Display all contacts"
		puts " [4] Display one contact"
		puts " [5] Display attributes"
		puts " [6] Delete a contact"
		puts " [7] Exit"
		puts "Enter a number:"
	end

	def choose_option(option)
		case option
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_all_contacts
		when 4 then display_one_contact
		when 5 then display_attribute
		when 6 then delete_contact
		when 7 then Kernel.exit
		else 
			puts "Please enter a valid input number."
			return
		end
	end

	def add_contact
		loop do 
			print "First Name:"
			first_name = gets.chomp
			print "Last Name:"
			last_name = gets.chomp
			print "Email:"
			email = gets.chomp
			print "Note:"
			note = gets.chomp
			contact = Contact.new(first_name, last_name, email, note)
		
			if contact.valid?
				@rolodex.add_contact(contact)
				return
			end
		end
	end

	def modify_contact
		puts "What contact would you like to modify (Input id)?"
		id = gets.chomp.to_i
		puts "Modify an attribute of ID:#{id[0]} (enter yes or no):"
		condition = gets.chomp.downcase
		if condition == "yes"
			puts "Input number for:"
			puts "[1]Name"
			puts "[2]Last Name"
			puts "[3]Email"
			puts "[4]Note"
			puts "What attribute would you like to modify?"
			attribute = gets.chomp.to_i
			puts "Enter new attribute value"
			new_value = gets.chomp
			@rolodex.modify_contact(id, attribute, new_value)
		else print_main_menu
		end
	end	

	
	def display_all_contacts
		@rolodex.contacts.each do |contact|
			puts "#{contact.first_name}, #{contact.last_name}, <#{contact.email}>, #{contact.note}, ID: #{contact.id}"
		end
	end

	def display_one_contact
		puts "What contact are you looking for (Input Id)?"
		single_index = gets.chomp.to_i
		@rolodex.display_single(single_index)
	end

	def display_attribute
		puts "Please input the desired attributes: "
		puts "[1] First name"
		puts "[2] Last name"
		puts "[3] Email"
		puts "[4] Note"
		puts "[5] ID" 
		attribute = gets.chomp.to_i
		case attribute
		when 1
			@rolodex.contacts.each do |contact|
				puts "#{contact.first_name}"
			end
		when 2
			@rolodex.contacts.each do |contact|
				puts "#{contact.last_name}"
			end
		when 3
			@rolodex.contacts.each do |contact|
				puts "#{contact.email}"
			end
		when 4
			@rolodex.contacts.each do |contact|
				puts "#{contact.note}"
			end
		when 5
			@rolodex.contacts.each do |contact|
				puts "#{contact.id}"
			end
		end
	end

	def delete_contact
		puts "Type the contact id number you want to delete"
		id_delete = gets.chomp.to_i
		@rolodex.delete_contact(id_delete)
		puts "contact #{id_delete} was deleted"
	end
end



crm = Crm.new ("Jon's CRM App") 
crm.main_menu