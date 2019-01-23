require_relative '../config/environment'

new_game = CLI.new
new_game.welcome
new_game.get_todays_hero
new_game.display_menu
puts "Go forth and prosper"
