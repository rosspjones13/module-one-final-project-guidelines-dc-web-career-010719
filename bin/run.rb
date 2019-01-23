require_relative '../config/environment'

new_game = CLI.new

new_game.welcome
new_game.set_todays_hero
system "clear"
new_game.display_menu

new_game.display_board

# Quest.find(1).start_quest
new_game.run_quest

binding.pry
puts "Go forth and prosper"
