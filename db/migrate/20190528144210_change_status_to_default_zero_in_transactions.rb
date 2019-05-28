class ChangeStatusToDefaultZeroInTransactions < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :transactions,
      :status,
      0
    )
  end
end
