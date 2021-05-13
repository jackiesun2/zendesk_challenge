# Zendesk Ticket Viewer

Zendesk Ticket Viewer is a interactive command line application that shows users their inbox of tickets.

## Installation

Firstly, ensure you are in the correct directory int he command prompt. You should be in the zendesk_challenge folder.

Ensure all the relevant gems are in the Gemfile. These include:

```ruby
    gem "rspec", "~> 3.10"
    gem 'faraday'
```

And then execute:

```bash
    bundle
```

# Usage

In order to start the application, ensure you are in the command line and in the relevant folder directory. To initiate a session on the application enter the following:

```bash
    $ ruby app/ticket_viewer.rb
```

In the main menu, select 1 to view all tickets, select 2 to view a ticket and select 3 to exit the application. Press the enter or return key to submit your answer on the application. At the bottom of the terminal application, a message will prompt the user what to do next. If an error occurs, the application will prompt an error message.
