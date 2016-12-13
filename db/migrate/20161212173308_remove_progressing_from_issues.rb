class RemoveProgressingFromIssues < ActiveRecord::Migration[5.0]
  def change
    remove_column :issues, :progressing, :boolean
  end
end
