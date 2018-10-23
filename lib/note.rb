class Note < ActiveRecord::Base
belongs_to :user
belongs_to :subject
has_many groups, through: :users

end
