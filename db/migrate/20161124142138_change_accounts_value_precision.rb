class ChangeAccountsValuePrecision < ActiveRecord::Migration
  def change
  	change_column :accounts , :value, :decimal, :precision =>2
  end
end
