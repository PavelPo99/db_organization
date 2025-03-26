class Author < ApplicationRecord
  has_many :authors_articles, dependent: :destroy
  has_many :articles, through: :authors_articles

  has_many :authors_book_chapters, dependent: :destroy
  has_many :book_chapters, through: :authors_book_chapters

  has_many :authors_reports, dependent: :destroy
  has_many :reports, through: :authors_reports

  validates :full_name, presence: true
  validates :orcid, format: {
    with: /\A\d{4}-\d{4}-\d{4}-\d{3}[0-9X]\z/,
    message: "Неверный формат ORCID"
  }, uniqueness: true
end
