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

  def self.select_quest
    selection = TTY::Prompt.new.yes?("Would you like to start this quest?") do |q|
      q.positive 'Yes'
      q.negative 'No'
      q.convert -> (input) { !input.match(/^yes/i).nil?}
    end
    if selection
      @new_quest.play_quest 
    else 
      system "clear"
      Quest.find_new
    end
  end

  def self.find_new
    puts "\n**************************\n\n" 
    q_name = TTY::Prompt.new.select("Please select your journey!", Quest.all.map(&:name), 
    per_page: 15, filter: true)
    @new_quest = Quest.find_by(name: q_name)
    @new_quest.display_info
    Quest.select_quest
  end


#Selection Options
def make_choice
  @choice = {
    good:["Perform heroic act", "Save the day!", "Use powers to defend citizens"],
    bad: ["Do nothing", "Run away", "Use powers for evil"],
    neutral:["Ask someone else", "Phone a friend", "Use powers to take a nap"]
    }
  @choice.map {|x, y| y.sample}

end

#display scenario selection options
  def display_scenario_selections
    # prompt = TTY::Prompt.new
    # make_choice
    scenario = TTY::Prompt.new.select("", make_choice)
    power_increase(scenario)
  end

#Increases or decreases power upon selection
  def power_increase(input)
    if @choice[:good].include?(input)
      @power += 5
    elsif @choice[:bad].include?(input)
      @power -= 5
    end
      @power
  end

#displays  scenario and give users an option. Game should stop to wait for input.
  def play_quest
    @power = 0
    scenarios.each do |scenario|
      system "clear"
      puts scenario.description
      display_scenario_selections
    end
    @power
  end

end
