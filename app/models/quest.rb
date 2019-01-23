class Quest < ActiveRecord::Base
  has_many :scenarios

  def display_info
    puts self.name
    puts self.description
  end

  def self.show_quests
    self.all.each do |quest|
      puts quest.name
      puts quest.description
    end
  end
  
end