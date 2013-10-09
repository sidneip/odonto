class CreateDescritivoFaturas < ActiveRecord::Migration
  def change
    create_table :descritivo_faturas do |t|
      t.integer :fatura_id
      t.string :descricao
      t.float :valor
      t.integer :clinica_id
      t.timestamps
    end
  end
  def down
  	drop_table :descritivo_faturas
  end
end
