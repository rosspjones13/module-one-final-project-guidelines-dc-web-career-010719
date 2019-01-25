# barry = Superhero.find_or_create_by(name: "The Flash", power: 60, combat: 80)
# bruce = Superhero.find_or_create_by(name: "Batman", power: 50, combat: 75)
# tony = Superhero.find_or_create_by(name: "Iron Man", power: 80, combat: 70)
# doom = Villain.find_or_create_by(name: "Dr. Doom", power: 70, combat: 50)
# mag = Villain.find_or_create_by(name: "Magneto", power: 85, combat: 70)

# fight1 = Fight.find_or_create_by(superhero: barry, villain: doom, location: "Somewhere in time")
# fight2 = Fight.find_or_create_by(superhero: tony, villain: mag, location: "Stark Tower")

q1 = Quest.find_or_create_by(name:"Public Pandemonium", description: "Chaos! Complete and utter turmoil has befallen the city!  Massive fires, earthquakes, and… was that a bear?! What on earth is National City to do? Never fear, our fearless leader is here! Work through the scenarios to save the city and boost your power. Should you prevail, yourpower stats will be greatly rewarded. Fail, and watch your precious city burn.")
q2 = Quest.find_or_create_by(name:"Bombs Away!", description: "A staff member at General Hospital has been taken hostage! Meanwhile, a bomb lurks on the premises, threatening to deploy at a moment’s notice. Can our hero save the day?")
q3 = Quest.find_or_create_by(name:"Cutting Class", description: "A science institute was formed to study the recent super empowering event. They offered to secure those super criminals that local government still can't contain, while also offering to help those who gained powers and wish to be tested willingly. However, rumors begin to circulate of abusive tests, of people not being allowed to go home, not being allowed to communicate with their families, etc. Are these simply rumors started by a few of the prisoners who are being detained with law enforcement's approval, or is the institute holding people against their will, subjecting them to experiments in the hopes of replicating their powers?")

Scenario.find_or_create_by(description: "A fire has broken out at city hall, and the building is close to collapse. What do you do?", quest: q1)
Scenario.find_or_create_by(description: "A distant rumbling has turned into a massive earthquake. Select your course of action.", quest: q1)
Scenario.find_or_create_by(description: "The bears have escaped the zoo and are terrorizing citizens. How should our hero react?", quest: q1)

Scenario.find_or_create_by(description: "A frightened staff member collapses on the ground from extreme pain.", quest: q2)
Scenario.find_or_create_by(description: "With 60 seconds left until the bomb explodes, there’s not much time to save our citizens!", quest: q2)
Scenario.find_or_create_by(description: "Hooray! You’ve managed to corner Marcus Mark; but, what’s this?! The villain is threatening to throw the hostage off roof!", quest: q2)

Scenario.find_or_create_by(description: "Amidst rumors that people are being held against their will, our hero must decide if the premises are worth investigating.", quest: q3)
Scenario.find_or_create_by(description: "Guards jump out of nowhere and start shooting… endangering citizens.", quest: q3)
Scenario.find_or_create_by(description: "Reprieve! The science institute has been shut down. But now the super criminals  have turned on today’s hero!", quest: q3)