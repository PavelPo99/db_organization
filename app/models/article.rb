class Article < ApplicationRecord
  has_many :authors_articles, dependent: :destroy
  has_many :authors, through: :authors_articles

  belongs_to :journal

  validates :doi, presence: true, format: {
              with: /\A10\.\d{4,5}\/[\w\.-]+\z/,
              message: "Неверный формат DOI. Должен быть в формате 10.xxxx/yyyy"
            }, uniqueness: true
end
