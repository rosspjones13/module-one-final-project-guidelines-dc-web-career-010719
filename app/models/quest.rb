class Quest < ActiveRecord::Base
  has_many :scenarios

#Shows current quest  
  def display_info
    puts name
    puts description
  end

#Shows all Quests
  def self.show_quests
    self.all.each do |quest|
      puts quest.name
      puts quest.description
    end
  end

  def self.find_quest
    puts "\n**************************\n\n"
    puts "Please select your journey!"
    Quest.find_by(name: gets.chomp)
  end


#Selection Options
  @choice = {
    good:["Perform heroic act", "Save the day!", "Use powers to defend citizens"],
    bad: ["Do nothing", "Run away", "Use powers for evil"],
    neutral:["Ask someone else", "Phone a friend", "Use powers to take a nap"]
  }


#display scenario selection options
  def display_scenario_selections
    prompt = TTY::Prompt.new
    @selection = prompt.select("Make your selection") do |menu|
      menu.enum "."
      menu.choice "Do something good", 1
      menu.choice "Do something bad", 2
      menu.choice "Do nothing", 3
    end
    power_increase(@selection)
  end

#Increases or decreases power upon selection
  def power_increase(input)
    case input
    when 1
      @power += 5
    when 2
      @power -= 5
    end
      @power
  end

#displays  scenario and give them an option. Game should stop to wait for input.
  def play_quest
    @power = 0
    scenarios.each do |scenario|
      puts scenario.description
      display_scenario_selections
    end
    @power
  end

end
