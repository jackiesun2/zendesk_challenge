require_relative '../menu_item'
require_relative '../menu'

describe MenuItem do
    it 'should return the subject of the ticket' do
        requester_id = 1
        assignee_id = 10
        subject = "sample ticket"
        description = "this is a new ticket"
        tags = ["first ticket", "important"]
        menu_item = Ticket.new(requester_id, assignee_id, subject, description, tags)
        expect(menu_item.subject).to eq(subject)
    end

    it 'should return the request id of the ticket' do 
        requester_id = 1
        assignee_id = 10
        subject = "sample ticket"
        description = "this is a new ticket"
        tags = ["first ticket", "important"]
        menu_item = Ticket.new(requester_id, assignee_id, subject, description, tags)
        expect(menu_item.requester_id).to eq(requester_id)
    end

end

describe Menu do
    it 'should be able to count the number of tickets' do
        menu = Menu.new([
            {
                "requester_id": 1,
                "assignee_id": 10,
                "subject": "sample ticket",
                "description": "this is a new ticket",
                "tags": ["first ticket", "important"]
            }
        ])
        expect(menu.ticket_count).to be(1)
    end
 
end

