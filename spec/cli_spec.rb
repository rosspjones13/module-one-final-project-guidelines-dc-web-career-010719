require_relative "../config/environment.rb"

describe "All instantiated models" do
  let (:fight) {Fight.new}
  it "returns true when a new fight is instantiated" do
    expect(fight.is_a?(Fight)).to be true
  end

  let (:hero) {Superhero.new}
  it "returns true when a new superhero is instantiated" do
    expect(hero.is_a?(Superhero)).to be true
  end

  let (:quest) {Quest.new}
  it "returns true when a new quest is instantiated" do
    expect(quest.is_a?(Quest)).to be true
  end

  let (:vill) {Villain.new}
  it "returns true when a new villain is instantiated" do
    expect(vill.is_a?(Villain)).to be true
  end
end

describe "Superhero instance methods" do
  let (:hero) {Superhero.new(power:55, combat:55)}
  it "increases the hero's power by passed in amount" do
    expect(hero.increase_power_by(10)).to eq 65
  end

  let (:hero) {Superhero.new(power: 55, combat: 55)}
  it "displays the hero's stats" do
    expect{hero.display_stats}.to output("Power: #{55}. Combat: #{55}\nDo not be afraid of your power. Start a new challenge.\n").to_stdout
  end
end

describe "Command Line Methods" do
  let (:new_player) {CLI.new}
  it "creates a new player from STDOUT input" do
    expect(new_player.create_new_player.is_a?(Superhero)).to be true
  end
end

#To run RSPEC against test environment, type to terminal --> RAILS_ENV="test" rspec
