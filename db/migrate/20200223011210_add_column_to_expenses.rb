class AddColumnToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :cost, :float
  end
end
