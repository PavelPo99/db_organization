class CreateJournals < ActiveRecord::Migration[7.2]
  def change
    create_table :journals do |t|
      t.string :name, null: false
      t.string :issn, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
