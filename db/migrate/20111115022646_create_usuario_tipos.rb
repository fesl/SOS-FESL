class CreateUsuarioTipos < ActiveRecord::Migration
  def self.up
    create_table :usuario_tipos do |t|
      t.string :nome, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :usuario_tipos
  end
end
