class CreateConsultas < ActiveRecord::Migration
  def change
    create_table :consultas do |t|
      t.date :data
      t.string :hora_inicio
      t.string :hora_fim
      t.string :tipo
      t.integer :procedimento_id
      t.integer :paciente_id
      t.integer :convenio_id
      t.integer :dentista_id
      t.text :observacao
      t.string :status
      t.integer :clinica_id
      t.timestamps
    end
  end
  def down
    drop_table :consultas
  end
end
