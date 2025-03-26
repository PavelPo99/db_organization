class AuthorsBookChapter < ApplicationRecord
  belongs_to :author
  belongs_to :book_chapter
end
