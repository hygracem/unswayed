class AddReferenceToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :reporter, foreign_key: true
  end
end
