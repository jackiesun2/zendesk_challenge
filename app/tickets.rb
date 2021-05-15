require_relative './session'

class Tickets 
    attr_accessor :tickets

    def initialize(tickets = [])
        @zendesk_tickets = tickets[:tickets]
    end

    def view_all
        display_tickets = true
        while display_tickets
            system 'clear'
            ticket_reset = 0
            @zendesk_tickets.each do |ticket|
                puts "Ticket Number: #{ticket[:id]} | Assignee id: #{ticket[:assignee_id]}"
                puts "Subject: #{ticket[:subject]}"
                puts "Description:"
                puts "#{ticket[:description][0..50]}"
                puts "-" * 40
                ticket_reset += 1
                if ticket_reset >= 20
                    menu_selection_all
                    ticket_reset = 0
                end
            end
            display_tickets = last_page
            refresh_session = Session.new
            @zendesk_tickets = refresh_session.load_tickets(2)[:tickets]
        end
    end

    def last_page
        if @zendesk_tickets.length == 100 
            true
        else 
            puts "No more further tickets, press any key to return to main menu"
            gets.chomp
            system 'clear'
            false  
        end
    end

    def menu_selection_all
        puts "Type anything or press enter for next page"
        gets.chomp
    end

end