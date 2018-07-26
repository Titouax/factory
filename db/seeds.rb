# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

20.times do |index|
 Part.create(
    part_number: Faker::Name.first_name
  )
  Assembly.create(
    name: Faker::Name.first_name
  )
end

# these two last commands fill up the assemblies_parts table
# give each part a random assembly
Part.all.each do |part|
 part.assemblies.push(Assembly.all.sample)
 part.save
end

# give each assembly a random part
Assembly.all.each do |assembly|
 assembly.parts.push(Part.all.sample)
 assembly.save
end
