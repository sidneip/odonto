class CreateConsultaProcedimentos < ActiveRecord::Migration
  def change
    create_table :consulta_procedimentos do |t|
      t.integer :clinica_id
      t.integer :procedimento_id
      t.integer :consulta_id
      t.float :valor

      t.timestamps
    end
  end
end
