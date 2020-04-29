class CreateUsersArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :users_articles do |t|
      t.integer :ref_article
      t.string :ideology
      t.integer :fact_check_rating
      t.string :comment

      t.timestamps
    end
  end
end
