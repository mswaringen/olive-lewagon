class Transaction < ApplicationRecord
  belongs_to :portfolio
  monetize :amount_cents
  enum status: [:pending, :paid]
end
