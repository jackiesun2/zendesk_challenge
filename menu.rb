class Menu
    attr_accessor :tickets

    def initialize(tickets = [])
        @tickets = tickets
    end

    def welcome_message
        puts "Welcome to Zendesk Ticket Viewer"
        puts "Select from one of the following options:"
        puts "-" * 20
        puts "Press 1 to view all tickets"
        puts "Press 2 to view a ticket"
        puts "Type 'quit' to exit"
        puts "-" * 20
    end

    def menu_choice
        selection = gets.chomp.to_i
        case selection
        when 1
            view_all
        when 2
            puts "View one ticket mode"
        when 3
            puts "Exit"
        else
            puts "Invalid choice, select between 1-3"
            welcome_message 
        end
    end

    def view_all
        @tickets = load_tickets[:tickets]
        system 'clear'
        ticket_counter = 0
        @tickets.each do |ticket|
            puts "Assignee id: #{ticket[:assignee_id]}"
            puts "Subject: #{ticket[:subject]}"
            puts "Description:"
            puts "#{ticket[:description]}"
            puts "*" * 40
            ticket_counter += 1
            if ticket_counter >= 25
                puts "Press enter for next page"
                gets.chomp
                system 'clear'
                ticket_counter = 0
            end
        end
    end

    def load_tickets
        begin
            data = File.read("tickets.json")
            JSON.parse(data, symbolize_names: true)
        rescue Errno::ENOENT
            puts "JSON file does not exist"
            exit
        end 
    end

end

# welcome message in a method
# shows a list of tickets 
# counts tickets up to 25 tickets and stops, providers next page 