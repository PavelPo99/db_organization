# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_03_25_194831) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "original_title", null: false
    t.string "english_title"
    t.date "publication_date", null: false
    t.string "doi", null: false
    t.bigint "journal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doi"], name: "index_articles_on_doi", unique: true
    t.index ["journal_id"], name: "index_articles_on_journal_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "orcid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orcid"], name: "index_authors_on_orcid", unique: true
  end

  create_table "authors_articles", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_authors_articles_on_article_id"
    t.index ["author_id", "article_id"], name: "index_authors_articles_on_author_id_and_article_id", unique: true
    t.index ["author_id"], name: "index_authors_articles_on_author_id"
  end

  create_table "authors_book_chapters", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "book_chapter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "book_chapter_id"], name: "index_authors_book_chapters_on_author_id_and_book_chapter_id", unique: true
    t.index ["author_id"], name: "index_authors_book_chapters_on_author_id"
    t.index ["book_chapter_id"], name: "index_authors_book_chapters_on_book_chapter_id"
  end

  create_table "authors_reports", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "report_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "report_id"], name: "index_authors_reports_on_author_id_and_report_id", unique: true
    t.index ["author_id"], name: "index_authors_reports_on_author_id"
    t.index ["report_id"], name: "index_authors_reports_on_report_id"
  end

  create_table "book_chapters", force: :cascade do |t|
    t.string "original_title"
    t.string "english_title"
    t.date "publication_date"
    t.string "publisher"
    t.string "isbn", null: false
    t.integer "number_pages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["isbn"], name: "index_book_chapters_on_isbn", unique: true
  end

  create_table "journals", force: :cascade do |t|
    t.string "name", null: false
    t.string "issn", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issn"], name: "index_journals_on_issn", unique: true
  end

  create_table "reports", force: :cascade do |t|
    t.string "original_title"
    t.string "english_title"
    t.date "publication_date"
    t.bigint "speaker_id", null: false
    t.string "conference_name"
    t.string "conference_venue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["speaker_id"], name: "index_reports_on_speaker_id"
  end

  add_foreign_key "articles", "journals"
  add_foreign_key "authors_articles", "articles"
  add_foreign_key "authors_articles", "authors"
  add_foreign_key "authors_book_chapters", "authors"
  add_foreign_key "authors_book_chapters", "book_chapters"
  add_foreign_key "authors_reports", "authors"
  add_foreign_key "authors_reports", "reports"
  add_foreign_key "reports", "authors", column: "speaker_id"
end
