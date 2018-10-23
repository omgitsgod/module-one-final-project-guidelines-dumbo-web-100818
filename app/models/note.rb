class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  def Note.bookmarked
    :user.bookmarks
end
