# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cat.destroy_all

whiskers = Cat.create(birth_date: Time.now, color: "red", name: "Whiskers", sex: "F", description: "a female cat")
tom = Cat.create(birth_date: Time.now, color: "grey", name: "Tom", sex: "M", description: "a tom cat")
felix = Cat.create(birth_date: Time.now, color: "black", name: "Felix", sex: "M", description: "a felix cat")
