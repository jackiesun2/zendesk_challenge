require_relative './Tickets'
require_relative './Ticket'

class Session

    def initialize

    end

    def load_tickets(username, password)
        conn = Faraday.new
        conn.basic_auth(username, password)
        response = conn.get('https://jackiesun2.zendesk.com/api/v2/tickets.json')
        @@zendesk_tickets = JSON.parse(response.body, symbolize_names: true)
    end

    def welcome_message
        puts "Welcome to Zendesk Ticket Viewer"
        puts "Select from one of the following options:"
        puts "-" * 30
        puts "Press 1 to view all tickets"
        puts "Press 2 to view a ticket"
        puts "Press 3 to exit"
        puts "-" * 30
    end

    def menu
        selection = gets.chomp.to_i
        case selection
        when 1
            all_tickets = Tickets.new
            all_tickets.view_all
        when 2
            single_ticket = Ticket.new
            single_ticket.view_ticket
        when 3
            system 'clear'
            puts "Goodbye!"
            exit
        else
            system 'clear'
            puts "Invalid choice, select between 1, 2 or 3"
            welcome_message 
            menu
        end
    end
   
end