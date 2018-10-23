class User < ActiveRecord::Base
has_many :notes
belongs_to :groups
has_many :subjects, through: :notes




end
