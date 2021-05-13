require_relative './session'

class Ticket

    def initialize(tickets = {})
        @zendesk_tickets = tickets[:tickets]
    end

    def view_ticket
        show_ticket(@zendesk_tickets)
    end

    def show_ticket(ticket_array)
        system 'clear'
        ticket_reset = 0
        ticket_array.each_with_index do |ticket, index| 
            puts "Ticket Number: #{index + 1} | Subject: #{ticket[:subject]}"
            puts "-" * 30
            ticket_reset += 1
            if ticket_reset >= 25
                ticket_reset = 0
                puts "Enter ticket number | Type anything or press enter for next page"
                user_input = gets.chomp
                select_ticket(user_input)
            end
        end
        refresh_session = Session.new
        refresh_session.menu_redirect
    end
    
    def select_ticket(input)
        if input.match(/[0-9]+/)
            # if input.to_i == (1..@zendesk_tickets.length) 
                # ticket_index = (input.to_i - 1)  
                # system 'clear'
                # puts "Ticket Number: #{input}"
                puts @zendesk_tickets.length
        #         puts "Requester ID: #{@zendesk_tickets[ticket_index][:requester_id]}"
        #         puts "Subject: #{@zendesk_tickets[ticket_index][:subject]}"
        #         puts "Description: #{@zendesk_tickets[ticket_index][:description]}"
        #         puts "-" * 20
        #         menu_selection_single
        #     else
        #         system 'clear'
        #         puts "Please input valid ticket number"
        #         menu_selection_single
            # end
        # elsif input == "m"
        #     refresh_session = Session.new
        #     refresh_session.menu_redirect
        # else
        #     system 'clear'
        end
    end

    def menu_selection_single
        puts "Press 1 to return to menu and press 2 to view all tickets"
        redirect_input = gets.chomp.to_i
        case redirect_input
        when 1 
            refresh_session = Session.new
            refresh_session.menu_redirect
        when 2
            system 'clear'
            view_ticket
        end
    end

end

