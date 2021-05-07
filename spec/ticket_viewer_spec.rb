require_relative '../menu_item'
require_relative '../menu'
require_relative '../order'
require_relative '../ticket_viewer'

describe MenuItem do
    it 'should return the subject of the ticket' do
        requester_id = 1
        subject = "sample ticket"
        menu_item = MenuItem.new(requester_id, subject)
        expect(menu_item.subject).to eq(subject)
    end
end