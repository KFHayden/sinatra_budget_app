class AddCostAmountToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :cost, :string
  end
end
