class ChangeAccountPrecisionAndScale < ActiveRecord::Migration
  def change
  	change_column :accounts , :value, :decimal, :precision =>8,:scale =>2
  end
end
