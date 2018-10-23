class AddContentToNotes < ActiveRecord::Migration[4.2]
  def change
    add_column :notes, :content, :string
  end
end
