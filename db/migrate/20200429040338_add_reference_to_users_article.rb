class AddReferenceToUsersArticle < ActiveRecord::Migration[5.2]
  def change
    add_reference :users_articles, :article, foreign_key: true
    add_reference :users_articles, :user, foreign_key: true
  end
end
