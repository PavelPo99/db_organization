class AuthorsReport < ApplicationRecord
  belongs_to :author
  belongs_to :report
end
