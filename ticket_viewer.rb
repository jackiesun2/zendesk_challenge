require_relative './menu'
require "json"
# runs the method to show one ticket
# runs the method to show multiple tickets
# case statement to select options 1 = show all tickets, 2 = select ticket 3 = exit
hello = Menu.new("Hello")
hello.welcome_message
hello.menu_choice