class BookChapter < ApplicationRecord
  has_many :authors_book_chapters, dependent: :destroy
  has_many :authors, through: :authors_book_chapters

  validates :isbn, presence: true, format: {
    with:  /\A(?:\d{3}-)?\d{9}[\dX]\z|\A(?:\d{3}-)?\d{13}\z/,
    message: "Неверный формат ISBN. Должен быть в формате ISBN-10 или ISBN-10"
  }, uniqueness: true
end
