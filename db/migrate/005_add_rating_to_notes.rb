class AddRatingToNotes < ActiveRecord::Migration[4.2]
  def change
    add_column :notes, :rating, :integer
  end
end
