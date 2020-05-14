class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :qualification
      t.date :dob
      t.string :project

      t.timestamps
    end
  end
end
