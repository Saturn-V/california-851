class AddCodeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :house_code, :string
  end
end
