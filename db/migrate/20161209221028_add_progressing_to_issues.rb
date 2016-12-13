class AddProgressingToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :progressing, :boolean, default: false
  end
end
