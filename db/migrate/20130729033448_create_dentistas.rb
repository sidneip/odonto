class CreateDentistas < ActiveRecord::Migration
  def change
    create_table :dentistas do |t|
      t.string :nome
      t.string :email
      t.string :password
      t.string :sexo
      t.date :data_nasc
      t.string :estado_civil
      t.string :cep
      t.string :rua
      t.integer :numero
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :complemento
      t.string :telefone
      t.string :celular
      t.string :identidade_rg
      t.string :orgao_rg
      t.string :cpf
      t.integer :cro

      t.timestamps
    end
  end
  def down
    drop_table :dentistas
  end
end
