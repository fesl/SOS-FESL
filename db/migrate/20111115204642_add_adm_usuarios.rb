class AddAdmUsuarios < ActiveRecord::Migration
  def self.up
  	add_column :usuarios, :adm, :integer, :null => true
  end

  def self.down
  	remove_column :usuarios, :adm
  end
end
