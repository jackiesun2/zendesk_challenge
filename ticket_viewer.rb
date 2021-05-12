require_relative './session'
require "json"
require 'faraday'

session_new = Session.new
session_new.load_tickets('jackiesun2@gmail.com', 'password')
session_new.welcome_message
session_new.menu

