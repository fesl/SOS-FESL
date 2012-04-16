class AddStatusChamado < ActiveRecord::Migration
  def self.up
  	add_column :chamados, :chamado_status_id, :integer, :null => false, :default => 1
  end

  def self.down
  	remove_column :chamados, :chamado_status_id
  end
end
