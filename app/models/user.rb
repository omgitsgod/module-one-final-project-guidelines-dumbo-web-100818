class User < ActiveRecord::Base
  belongs_to :group
  has_many :notes
  has_many :subjects, through: :notes
end
