require_relative './session'

class Tickets 
    attr_accessor :tickets

    def initialize(tickets = [])
        @zendesk_tickets = tickets[:tickets]
        @page = 1
    end

    def view_all
        system 'clear'
        # ticket_reset = 0
        @zendesk_tickets.each_with_index do |ticket, index|
            puts "Ticket Number: #{index + 1} | Assignee id: #{ticket[:assignee_id]}"
            puts "Subject: #{ticket[:subject]}"
            puts "Description:"
            puts "#{ticket[:description][0..50]}"
            puts "-" * 40
        #     ticket_reset += 1
        #     if ticket_reset >= 25
        #         menu_selection_all
        #         ticket_reset = 0
            # end
            if (index + 1) == @zendesk_tickets.length
                @page += 1
                puts "End of list, press any key to return to main menu"
                gets.chomp
                credentials = JSON.parse(File.read("././credentials.json"), symbolize_names: true)
                refresh_session = Session.new
                refresh_session.next_page(credentials[:username], credentials[:password])
                system 'clear'
                pp @zendesk_tickets[0]
                # refresh_session.menu_redirect
            end
        end
    end

    def menu_selection_all
        puts "Type anything or press enter for next page | Type 'm' to return to menu"
        input = gets.chomp.downcase
        if input == "m"
            refresh_session = Session.new
            refresh_session.menu_redirect
        end
    end

end