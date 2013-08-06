class CreatePacientes < ActiveRecord::Migration
  def change
    create_table :pacientes do |t|
      t.string :nome
      t.string :sexo
      t.date :data_nascimento
      t.string :estado_civil
      t.string :nacionalidade
      t.string :nome_mae
      t.integer :cep
      t.string :rua
      t.string :numero
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :complemento
      t.integer :telefone
      t.integer :celular
      t.string :email
      t.integer :identidade_rg
      t.string :orgao_rg
      t.integer :cpf

      t.timestamps
    end
  end
  def down
    drop_table :pacientes
  end
end


