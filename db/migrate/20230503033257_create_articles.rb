class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      # Database columns

      # datatype :column_name, null: false
      t.string :title, null: false
      t.text :description,  null: false
      t.string :author, null: false
    end
  end
end
