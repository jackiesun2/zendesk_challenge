require_relative './Tickets'
require_relative './Ticket'

class Session

    def initialize
        @zendesk_tickets = {}
    end

    def load_tickets(username, password)
        begin
            conn = Faraday.new
            conn.basic_auth(username, password)
            response = conn.get('https://jackiesun2.zendesk.com/api/v2/tickets.json?page=1')
            @zendesk_tickets = JSON.parse(response.body, symbolize_names: true)
            raise StandardError if response.status.to_i >= 400 
        rescue 
            puts "This path is incorrect, please check again"
            exit
        end 
    end

    def next_page(username, password)
        begin
            conn = Faraday.new
            conn.basic_auth(username, password)
            response = conn.get('https://jackiesun2.zendesk.com/api/v2/tickets.json?page=2')
            @zendesk_tickets = JSON.parse(response.body, symbolize_names: true)
            raise StandardError if response.status.to_i >= 400 
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

    def menu
        selection = gets.chomp.to_i
        case selection
        when 1
            all_tickets = Tickets.new(@zendesk_tickets)
            all_tickets.view_all
        when 2
            single_ticket = Ticket.new(@zendesk_tickets)
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
   
    def menu_redirect
        system 'clear'
        credentials = JSON.parse(File.read("././credentials.json"), symbolize_names: true)
        refresh_session = Session.new
        refresh_session.load_tickets(credentials[:username], credentials[:password])
        refresh_session.welcome_message
        refresh_session.menu
    end

end