class AddIssueRefToUpdates < ActiveRecord::Migration[5.0]
  def change
    add_reference :updates, :issue, foreign_key: true
  end
end
