class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :category
      t.decimal :value
      t.string :type
      t.datetime :date

      t.timestamps null: false
    end
  end
end
