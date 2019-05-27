class Portfolio < ApplicationRecord
  belongs_to :user
  belongs_to :ngo
  has_many :transactions
end
