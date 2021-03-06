# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131108212359) do

  create_table "clinicas", force: true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",            default: true
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "consulta_procedimentos", force: true do |t|
    t.integer  "clinica_id"
    t.integer  "procedimento_id"
    t.integer  "consulta_id"
    t.float    "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultas", force: true do |t|
    t.date     "data"
    t.string   "hora_inicio"
    t.string   "hora_fim"
    t.string   "tipo"
    t.integer  "procedimento_id"
    t.integer  "paciente_id"
    t.integer  "convenio_id"
    t.integer  "dentista_id"
    t.text     "observacao"
    t.string   "status"
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "convenios", force: true do |t|
    t.integer  "codigo_convenio"
    t.integer  "cnpj"
    t.string   "razao_social"
    t.string   "nome_fantasia"
    t.string   "logradouro"
    t.integer  "numero"
    t.string   "bairro"
    t.string   "complemento"
    t.integer  "cep"
    t.string   "uf"
    t.string   "cidade"
    t.string   "telefone"
    t.string   "fax"
    t.string   "email"
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dentistas", force: true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "password"
    t.string   "sexo"
    t.date     "data_nasc"
    t.string   "estado_civil"
    t.string   "cep"
    t.string   "rua"
    t.integer  "numero"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "uf"
    t.string   "complemento"
    t.string   "telefone"
    t.string   "celular"
    t.string   "identidade_rg"
    t.string   "orgao_rg"
    t.string   "cpf"
    t.integer  "cro"
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "descritivo_faturas", force: true do |t|
    t.integer  "fatura_id"
    t.string   "descricao"
    t.float    "valor"
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faturas", force: true do |t|
    t.integer  "consulta_id"
    t.string   "descricao"
    t.float    "desconto"
    t.date     "vencimento"
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pacientes", force: true do |t|
    t.string   "nome"
    t.string   "sexo"
    t.date     "data_nascimento"
    t.string   "estado_civil"
    t.string   "nacionalidade"
    t.string   "nome_mae"
    t.integer  "cep"
    t.string   "rua"
    t.string   "numero"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "uf"
    t.string   "complemento"
    t.integer  "telefone"
    t.integer  "celular"
    t.string   "email"
    t.integer  "identidade_rg"
    t.string   "orgao_rg"
    t.integer  "cpf"
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "procedimentos", force: true do |t|
    t.string   "nome"
    t.string   "tipo"
    t.float    "valor"
    t.float    "custo"
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
