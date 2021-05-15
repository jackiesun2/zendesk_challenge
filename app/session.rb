require_relative './Tickets'
require_relative './Ticket'

class Session

    def initialize
        @zendesk_tickets = {}
        @credentials = JSON.parse(File.read("././credentials.json"), symbolize_names: true)
    end

# load_tickets method uses faraday gem to authenticate and creates a get request from zendesk API

    def load_tickets(page_number)
        begin
            conn = Faraday.new
            conn.basic_auth(@credentials[:username], @credentials[:password])
            response = conn.get("https://jackiesun2.zendesk.com/api/v2/tickets.json?page=#{page_number}")
            raise StandardError if response.status.to_i >= 400 
            @zendesk_tickets = JSON.parse(response.body, symbolize_names: true)
        rescue 
            puts "This path is incorrect, please check again"
            exit
        end 
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

# To view all tickets initalize the tickets class
# To view a ticket initalize the ticket class

    def menu
        selection = gets.chomp.to_i
        case selection
        when 1
            all_tickets = Tickets.new(@zendesk_tickets)
            all_tickets.view_all
        when 2
            single_ticket = Ticket.new(@zendesk_tickets)
            single_ticket.view_all
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