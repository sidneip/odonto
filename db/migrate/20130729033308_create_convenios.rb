# -*- encoding : utf-8 -*-
class CreateConvenios < ActiveRecord::Migration
  def change
    create_table :convenios do |t|
      t.integer :codigo_convenio
      t.integer :cnpj
      t.string :razao_social
      t.string :nome_fantasia
      t.string :logradouro
      t.integer :numero
      t.string :bairro
      t.string :complemento
      t.integer :cep
      t.string :uf
      t.string :cidade
      t.string :telefone
      t.string :fax
      t.string :email
      t.integer :clinica_id
      t.timestamps
    end
  end
  def down
    drop_table :convenios
  end
end
