class CreateChamados < ActiveRecord::Migration
  def self.up
    create_table :chamados do |t|
      t.string :nome, :null => :false
      t.string :coletivo, :null => :false
      t.string :frente, :null => :false
      t.belongs_to :chamado_tipos, :null => :false
      t.text :descricao, :null => :false

      t.timestamps
    end
  end

  def self.down
    drop_table :chamados
  end
end
