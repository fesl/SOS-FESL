class CreateResponsabilidades < ActiveRecord::Migration
  def self.up
    create_table :responsabilidades do |t|
      t.date :inicio, :null => false
      t.date :saida
      t.belongs_to :usuario, :null => false
      t.belongs_to :chamado, :null => false

      t.timestamps
    end
    
    add_index :responsabilidades, [:usuario_id, :chamado_id], :unique => :true
  end

  def self.down
    drop_table :responsabilidades
  end
end
