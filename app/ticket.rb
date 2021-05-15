require_relative './session'

class Ticket

    def initialize(tickets = {})
        @zendesk_tickets = tickets[:tickets]
    end

    def view_all
        display_tickets = true
        while display_tickets
            system 'clear'
            ticket_reset = 0
            @zendesk_tickets.each_with_index do |ticket, index| 
                puts "Ticket Number: #{ticket[:id]} | Subject: #{ticket[:subject]}"
                puts "-" * 30
                ticket_reset += 1
                if ticket_reset >= 25
                    ticket_reset = 0
                    puts "Enter a valid ticket number | Type anything or press enter for next page"
                    user_input = gets.chomp
                    display_tickets = select_ticket(user_input)
                    break unless display_tickets
                end
            end
            if display_tickets 
                display_tickets = last_page
                refresh_session = Session.new
                @zendesk_tickets = refresh_session.load_tickets(2)[:tickets]
            else
                break
            end
        end
    end

    def select_ticket(input, page_index = 0)
        if input.match(/[0-9]+/) && input.to_i.between?(1,@zendesk_tickets[-1][:id])
            ticket_index = page_index - (input.to_i - 1)  
            system 'clear'
            puts "Ticket Number: #{input}"
            puts "Requester ID: #{@zendesk_tickets[ticket_index][:requester_id]}"
            puts "Subject: #{@zendesk_tickets[ticket_index][:subject]}"
            puts "Description: #{@zendesk_tickets[ticket_index][:description]}"
            puts "-" * 20
            puts "Type anything or press enter to return to menu"
            user_selection = gets.chomp
            false
        else
            system 'clear'
        end
    end

    def last_page
        if @zendesk_tickets.length == 100
            true
        else
            puts "No more further tickets, select ticket or press any key to return to main menu"
            user_input = gets.chomp
            select_ticket(user_input, 100)
            system 'clear'
            false 
        end
    end
    
end



