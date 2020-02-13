class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :category
      t.integer :user_id
      
      t.timestamps null: false
        #Automatically gives timestamps anytime I create or update a model
    end
  end
end
