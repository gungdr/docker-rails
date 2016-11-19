class ChangeInquiries < ActiveRecord::Migration
  def self.up
    rename_column :inquiries, :type, :trans_type
  end
end
