class Transaction < ApplicationRecord
  belongs_to :portfolio

  enum status: [:active, :inactive]
end
