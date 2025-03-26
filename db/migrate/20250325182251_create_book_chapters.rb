class CreateBookChapters < ActiveRecord::Migration[7.2]
  def change
    create_table :book_chapters do |t|
      t.string :original_title
      t.string :english_title
      t.date :publication_date
      t.string :publisher
      t.string :isbn, null: false
      t.integer :number_pages

      t.timestamps
    end

    add_index :book_chapters, :isbn, unique: true
  end
end
