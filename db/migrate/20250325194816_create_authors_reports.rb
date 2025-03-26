class CreateAuthorsReports < ActiveRecord::Migration[7.2]
  def change
    create_table :authors_reports do |t|
      t.references :author, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end

    add_index :authors_reports, [ :author_id, :report_id ], unique: true
  end
end
