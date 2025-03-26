class Report < ApplicationRecord
  has_many :authors_reports, dependent: :destroy
  has_many :authors, through: :authors_reports
end
