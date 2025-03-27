class Journal < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :issn, uniqueness: true

  validates :issn, presence: true, format: {
              with: /\A\d{4}-\d{3}[\dX]\z/,
              message: "Неверный формат ISSN. Должен быть в формате XXXX-XXXX"
            }, uniqueness: true
end
