Fight.destroy_all
Superhero.destroy_all
Villain.destroy_all

barry = Superhero.find_or_create_by(name: "The Flash", power: 60, combat: 80)
bruce = Superhero.find_or_create_by(name: "Batman", power: 50, combat: 75)
tony = Superhero.find_or_create_by(name: "Iron Man", power: 80, combat: 70)
doom = Villain.find_or_create_by(name: "Dr. Doom", power: 70, combat: 50)
mag = Villain.find_or_create_by(name: "Magneto", power: 85, combat: 70)

fight1 = Fight.find_or_create_by(superhero: barry, villain: doom, location: "Somewhere in time")
fight2 = Fight.find_or_create_by(superhero: tony, villain: mag, location: "Stark Tower")
