require_relative '../app/session.rb'
require_relative '../app/tickets.rb'
require 'faraday'
require "json"

describe Session do

    it 'should return StandardError if credentials are incorrect' do
        conn = Faraday.new
        credentials = JSON.parse(File.read("././credentials.json"), symbolize_names: true)
        conn.basic_auth(credentials[:username], "Wrong_password")
        response = conn.get("https://jackiesun2.zendesk.com/api/v2/tickets.json?page=1")
        result = StandardError if response.status.to_i >= 400 
        expect(result).to eq(StandardError)
    end

    it 'should return StandardError if path is incorrect' do
        conn = Faraday.new
        credentials = JSON.parse(File.read("././credentials.json"), symbolize_names: true)
        conn.basic_auth(credentials[:username], credentials[:password])
        response = conn.get("https://jackiesun2.zendesk.com/api/v2/wrong_path")
        result = StandardError if response.status.to_i >= 400 
        expect(result).to eq(StandardError)
    end

    it 'should return an array of 100 tickets' do
        conn = Faraday.new
        credentials = JSON.parse(File.read("././credentials.json"), symbolize_names: true)
        conn.basic_auth(credentials[:username], credentials[:password])
        response = conn.get("https://jackiesun2.zendesk.com/api/v2/tickets.json?page=1")
        raise StandardError if response.status.to_i >= 400 
        zendesk_tickets = JSON.parse(response.body, symbolize_names: true)
        new_session = Tickets.new(zendesk_tickets)
        expect(zendesk_tickets[:tickets].length).to eq(100)
    end

end
