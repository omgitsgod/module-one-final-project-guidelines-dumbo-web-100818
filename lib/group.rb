class Group < ActiveRecord::Base
  has_many :users
  #is below correct? has many?
  has_many :notes, through: :users
  #how do I write has many to subjects?

end
