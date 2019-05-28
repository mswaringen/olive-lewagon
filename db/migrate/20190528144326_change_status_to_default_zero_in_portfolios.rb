class ChangeStatusToDefaultZeroInPortfolios < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :portfolios,
      :status,
      0
    )
  end
end
