class AddReceivedToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :received, :boolean, default: false
  end
end
