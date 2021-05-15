require_relative './session'
require "json"
require 'faraday'

# Initialize a new session and load the first 100 tickets. 
session_new = Session.new
session_new.load_tickets(1)
loop do
    session_new.welcome_message
    session_new.menu
end

