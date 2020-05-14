class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :email,    null: false
      t.string :password,  null: false  
      t.string :confirm_password, null: false

      t.timestamps
    end
  end
end
