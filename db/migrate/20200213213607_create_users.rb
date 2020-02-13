class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      
      t.timestamps null: false
        #Automatically gives timestamps anytime I create or update a model
    end
  end
end
