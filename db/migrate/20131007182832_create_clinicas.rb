# -*- encoding : utf-8 -*-
class CreateClinicas < ActiveRecord::Migration
  def change
    create_table :clinicas do |t|
      t.string :nome
      t.string :email
      t.string :password
      t.timestamps
      t.boolean :status, :default => true
    end
  end
  def down
  	drop_table :clinicas
  end
end

