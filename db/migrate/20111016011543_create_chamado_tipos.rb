class CreateChamadoTipos < ActiveRecord::Migration
  def self.up
    create_table :chamado_tipos do |t|
      t.string :nome, :null => :false

      t.timestamps
    end
  end

  def self.down
    drop_table :chamado_tipos
  end
end
