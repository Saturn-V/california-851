class AddBodyToAnnouncements < ActiveRecord::Migration[5.0]
  def change
    add_column :announcements, :body, :string
  end
end
