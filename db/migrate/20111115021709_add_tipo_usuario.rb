class AddTipoUsuario < ActiveRecord::Migration
  def self.up
  	add_column :usuarios, :usuario_tipos_id, :integer, :null => false, :default => 2
  end

  def self.down
  	remove_column :usuarios, :usuario_tipos_id
  end
end
