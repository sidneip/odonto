class CreateClinicas < ActiveRecord::Migration
  def change
    create_table :clinicas do |t|
      t.string :nome
      t.string :email
      t.string :senha
      t.timestamps
    end
  end
  def down
  	drop_table :clinicas
  end
end
