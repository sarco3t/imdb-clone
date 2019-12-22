# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@admin.com', password: 'admin@admin.com', role: :admin)

categories = (0..10).to_a.map do |n|
  Category.create(title: "Category #{n}")
end

500.times do |n|
  Movie.create(title: "movie #{n}", text: "description #{n}", category_id: categories.sample.id)
end