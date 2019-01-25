## Program Description
Our program is a Ruby based Superhero Fight Game which implements a REST API for database
retrival. We used gems to have the user experience a more visual representation of the game and made the CLI game to feel more interactive. The user starts by selecting or creating their own Superhero and then is brought to a main menu with different interactions. From the main menu, they can fight a villian from our database, train their power stats, go on a quest, show an image of their hero (from our database), view game instructions and display the top  10 heroes from the leaderboards.

# Installation Instructions
1. Fork and copy download path.
2. Go to lib/api.rb and where it says "https://superheroapi.com/api.php/<api id>/" replace the <api id> with your own api key from https://superheroapi.com/index.html
  - Uncomment the lines
      a = Api.new
      a.get_all_characters
      a.create_villain
      a.create_super
  - Run ruby lib/api.rb in your terminal to populate your database
  - If you'd like more than the set amount of heroes/villains modify the line in get_all_characters method
      for i in 1..50  
      to whichever first..last character id's you'd like to add
      - (careful some ranges may include characters with a down webpage so they cannot be added)
3. Before you bundle install our gem files, some gems may need additional parts installed first.
  - Installing ImageMagick
    1. Check if you have ImageMagick installed by typing in terminal:
      convert -version
    2. If not, or if you are running into errors still, in your terminal type:
      brew unlink imagemagick
      brew install imagemagick@6 && brew link imagemagick@6 --force
      to force install your ImageMagick version to our working version
  - Update your minitest version to the current working version by typing in terminal:
    rvm @global do gem uninstall minitest
  - Now you should be ready to install our incuded gems by typing:
    bundle install
4. Now you are ready to run with:
    ruby bin/run.rb

# 