# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
  # These `destroy_all` commands are not necessary--but will not hurt--if you
  # use `rails db:seed:replant`.
  puts "Destroying tables..."
  Corgi.destroy_all
  Cat.destroy_all

  # Reset the id (i.e., primary key) counters for each table to start at 1
  puts "Resetting primary keys..."
  %w(cats corgis).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

  puts "Populating seed data..."
  cat1 = Cat.create!(name: "Sennacy")
  cat2 = Cat.create!(name: "Garfield")
  corgi1 = Corgi.create!(name: "Shelly")
  corgi2 = Corgi.create!(name: "Prisca")
  toy1 = Toy.create!(name: "Toy1", toyable_type: cat1.class, toyable_id: cat1.id)
  toy2 = Toy.create!(name: "Toy2", toyable_type: cat1.class, toyable_id: cat1.id)
  toy3 = Toy.create!(name: "Toy1", toyable_type: cat2.class, toyable_id: cat2.id)
  toy4 = Toy.create!(name: "Toy3", toyable_type: corgi1.class, toyable_id: corgi1.id)




  puts "Done!"
end