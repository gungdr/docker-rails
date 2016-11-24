class ChangeAccounts < ActiveRecord::Migration
  def change
  	change_column :accounts , :value, :decimal
  	
  end
end
