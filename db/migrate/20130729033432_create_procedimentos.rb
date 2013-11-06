# -*- encoding : utf-8 -*-
  class CreateProcedimentos < ActiveRecord::Migration
  def change
    create_table :procedimentos do |t|
      t.string :nome
      t.string :tipo
      t.float :valor
      t.float :custo
      t.integer :clinica_id
      t.timestamps
    end
  end
  def down
  	drop_table :procedimentos
  end
end
