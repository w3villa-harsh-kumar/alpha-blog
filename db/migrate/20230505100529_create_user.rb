class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username #username column
      t.string :email #email column

      t.timestamps
    end
  end
end
