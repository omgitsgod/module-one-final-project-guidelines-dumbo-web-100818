require 'bundler'
require 'tty-prompt'
require 'tty-table'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
$prompt = TTY::Prompt.new
# require_all 'bin'
