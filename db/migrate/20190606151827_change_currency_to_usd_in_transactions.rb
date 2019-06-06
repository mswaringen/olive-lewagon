class ChangeCurrencyToUsdInTransactions < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :transactions,
      :amount_currency,
      'USD'
    )
  end
end
