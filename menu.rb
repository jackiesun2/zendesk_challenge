class Menu
    attr_accessor :tickets

    def initialize(tickets = [])
        @tickets = tickets
    end

    def ticket_count
        @tickets.length
    end

end

# shows a list of tickets 
# counts tickets up to 25 tickets and stops, providers next page 