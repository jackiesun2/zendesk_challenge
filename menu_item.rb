class MenuItem
    attr_reader :requester_id, :assignee_id, :subject, :description, :tags

    def initialize(requester_id, assignee_id, subject, description, tags)
        @requester_id = requester_id
        @assignee_id = assignee_id
        @subject = subject
        @description = description
        @tags = tags
    end

end

# display individual ticket 