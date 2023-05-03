class AddTimestampToArticles < ActiveRecord::Migration[7.0]
  def change
    # add_column :table_name, :column_name, :datatype
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
