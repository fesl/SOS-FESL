# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111115204642) do

  create_table "chamado_statuses", :force => true do |t|
    t.string   "nome",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chamado_tipos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chamados", :force => true do |t|
    t.string   "nome"
    t.string   "coletivo"
    t.string   "frente"
    t.integer  "chamado_tipos_id"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chamado_status_id", :default => 1, :null => false
  end

  create_table "responsabilidades", :force => true do |t|
    t.date     "inicio",     :null => false
    t.date     "saida"
    t.integer  "usuario_id", :null => false
    t.integer  "chamado_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responsabilidades", ["usuario_id", "chamado_id"], :name => "index_responsabilidades_on_usuario_id_and_chamado_id", :unique => true

  create_table "usuario_tipos", :force => true do |t|
    t.string   "nome",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "login"
    t.string   "senha"
    t.string   "email"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_tipos_id", :default => 2, :null => false
    t.integer  "adm"
  end

end
