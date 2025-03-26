class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :original_title, null: false
      t.string :english_title
      t.date :publication_date, null: false
      t.string :doi, null: false
      t.references :journal, null: false, foreign_key: true

      t.timestamps
    end

    add_index :articles, :doi, unique: true
  end
end
