# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all
Category.create id: 1, name: "Fantasy"
Category.create id: 2, name: "Science Fiction"

Book.delete_all
Book.create id: 1, title: "The Lord of the Rings", author: "J.R.R. Tolkien", category_id: Category.find(1).id, year: 1954
Book.create id: 2, title: "The Hobbit", author: "J.R.R. Tolkien", category_id: Category.find(1).id, year: 1937
Book.create id: 3, title: "The Silmarillion", author: "J.R.R. Tolkien", category_id: Category.find(1).id, year: 1977
Book.create id: 4, title: "Good Omens", author: "Terry Pratchett & Neil Gaiman", category_id: Category.find(1).id, year: 1990
Book.create id: 5, title: "Ender's Game", author: "Orson Scott Card", category_id: Category.find(2).id, year: 1985
