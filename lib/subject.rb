class Subject < ActiveRecord::Base
has_many :notes
has_many :users, through: :notes
#not sure how to write out  has_many groups.

end
