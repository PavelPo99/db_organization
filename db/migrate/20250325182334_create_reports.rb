class CreateReports < ActiveRecord::Migration[7.2]
  def change
    create_table :reports do |t|
      t.string :original_title
      t.string :english_title
      t.date :publication_date
      t.references :speaker, null: false, foreign_key: { to_table: :authors }
      t.string :conference_name
      t.string :conference_venue

      t.timestamps
    end
  end
end
