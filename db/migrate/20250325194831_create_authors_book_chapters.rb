class CreateAuthorsBookChapters < ActiveRecord::Migration[7.2]
  def change
    create_table :authors_book_chapters do |t|
      t.references :author, null: false, foreign_key: true
      t.references :book_chapter, null: false, foreign_key: true

      t.timestamps
    end

    add_index :authors_book_chapters, [ :author_id, :book_chapter_id ], unique: true
  end
end
