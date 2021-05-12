require_relative './session'

class Tickets 
    attr_accessor :tickets

    def initialize(tickets = [])
        @zendesk_tickets = tickets
    end

    def view_all
        system 'clear'
        ticket_reset = 0
        @zendesk_tickets[:tickets].each_with_index do |ticket, index|
            puts
            puts "Ticket Number: #{index + 1} | Assignee id: #{ticket[:assignee_id]}"
            puts "Subject: #{ticket[:subject]}"
            puts "-" * 40
            puts "Description:"
            puts "#{ticket[:description][0..50]}"
            puts "-" * 40
            ticket_reset += 1
            if ticket_reset >= 25
                menu_selection_all
                ticket_reset = 0
            end
        end
    end

    def menu_selection_all
        puts "Type anything or press enter for next page | type 'm' to return to menu"
        input = gets.chomp
        if input == "m"
            system 'clear'
            new_session = Session.new
            new_session.welcome_message
            new_session.menu
        end
    end

end