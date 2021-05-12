require_relative './session'

class Ticket
    attr_reader :requester_id, :assignee_id, :subject, :description, :tags

    def initialize(requester_id = 0, assignee_id = 0, subject = "", description = "", tags = [])
        @requester_id = requester_id
        @assignee_id = assignee_id
        @subject = subject
        @description = description
        @tags = tags
    end

    def view_ticket
        puts "Select ticket: "
        @tickets = load_tickets[:tickets]
        show_ticket(@tickets)
    end

    def ticket_counter
        
    end

    def show_ticket(ticket_array)
        system 'clear'
        ticket_counter = 1
        ticket_reset = 0
        ticket_array.each do |ticket| 
            puts "Ticket Number: #{ticket_counter} | Subject: #{ticket[:subject]}"
            puts "-" * 30
            if ticket_reset >= 20
                ticket_reset = 0
                puts "Enter ticket number or press enter for next page"
                user_input = gets.chomp
                system 'clear'
                select_ticket(user_input)
            end
            ticket_counter += 1
            ticket_reset += 1
        end
    end
    
    def select_ticket(input)
        @tickets = load_tickets[:tickets]
        if input.match(/[0-9]+/)
            ticket_index = input.to_i - 1  
            system 'clear'
            puts "Requester ID: #{@tickets[ticket_index][:requester_id]}"
            puts "Subject: #{@tickets[ticket_index][:subject]}"
            puts "Description: #{@tickets[ticket_index][:description]}"
            puts "-" * 20
            menu_selection_single
        else
        end
    end

    def menu_selection_single
        puts "Press 1 to return to menu and press 2 to view all tickets"
        redirect_input = gets.chomp.to_i
        case redirect_input
        when 1 
            system 'clear'
            new_session = Session.new
            new_session.welcome_message
            new_session.menu
        when 2
            system 'clear'
            view_ticket
        end
    end

end

