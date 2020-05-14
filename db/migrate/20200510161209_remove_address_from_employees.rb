class RemoveAddressFromEmployees < ActiveRecord::Migration[5.1]
  def change
    remove_column :employees, :address, :string
  end
end
