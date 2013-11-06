# -*- encoding : utf-8 -*-
class CreateFaturas < ActiveRecord::Migration
  def change
    create_table :faturas do |t|
      t.integer :consulta_id
      t.string :descricao
      t.float :desconto
      t.date :vencimento
      t.integer :clinica_id
      t.timestamps
    end
  end
  def down
    drop_table :faturas
  end
end
