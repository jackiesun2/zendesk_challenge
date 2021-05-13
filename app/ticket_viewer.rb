require_relative './session'
require "json"
require 'faraday'

credentials = JSON.parse(File.read("././credentials.json"), symbolize_names: true)
session_new = Session.new
session_new.load_tickets(credentials[:username], credentials[:password])
session_new.welcome_message
session_new.menu

