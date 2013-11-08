# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
	10.times do |n|
		Dentista.create!(:nome => "Dinho#{n}", :email => "dinho#{n}@odontow.com.br", :cro => "22222#{n}", :cpf => "222222222#{n}", :celular => "11111111#{n}")
	end
#   dentista = Dentista.create!
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	

