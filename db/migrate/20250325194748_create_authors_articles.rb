class CreateAuthorsArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :authors_articles do |t|
      t.references :author, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end

    add_index :authors_articles, [ :author_id, :article_id ], unique: true
  end
end
