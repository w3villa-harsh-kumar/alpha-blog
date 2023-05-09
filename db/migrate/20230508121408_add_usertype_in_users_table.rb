class AddUsertypeInUsersTable < ActiveRecord::Migration[7.0]
    def change
      add_column :users, :usertype, :string, default: "user"
    end
  end
  