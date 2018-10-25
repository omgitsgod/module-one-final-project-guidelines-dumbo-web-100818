require 'bundler'
require 'tty-prompt'
require 'tty-table'
require 'tty-spinner'
require 'rest-client'
require 'tty-command'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
$prompt = TTY::Prompt.new

# require_all 'bin'
