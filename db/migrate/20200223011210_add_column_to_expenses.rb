class AddColumnToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :cost, :float, default: 0.00
  end
end
