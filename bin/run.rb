require_relative '../config/environment'

new_game = CLI.new

new_game.welcome
new_game.set_todays_hero
system "clear"
new_game.display_menu

puts new_game.display_board


puts "Go forth and prosper"
