require 'bundler'
require 'active_record'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil
SINATRA_ACTIVESUPPORT_WARNING=false
require_all 'app'
require_all 'lib'
