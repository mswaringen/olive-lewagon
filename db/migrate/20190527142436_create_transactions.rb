class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :status
      t.json :stripe_response
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
