class ChangeInquiriesPrecisionAndScale < ActiveRecord::Migration
  def change
  	change_column :inquiries , :value, :decimal, :precision =>8,:scale =>2
  end
end
