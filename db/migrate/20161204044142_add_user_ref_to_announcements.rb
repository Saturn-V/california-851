class AddUserRefToAnnouncements < ActiveRecord::Migration[5.0]
  def change
    add_reference :announcements, :user, foreign_key: true
  end
end
