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
Category.create id: 3, name: "Horror"

Book.delete_all
Book.create id: 1, title: "The Lord of the Rings Trilogy", author: "J.R.R. Tolkien",
            category_id: Category.find(1).id, year: 1954,
            image_filename: "books/the_lord_of_the_rings_trilogy.png",
            description: "blablabla", price: 10.99
Book.create id: 2, title: "The Hobbit", author: "J.R.R. Tolkien",
            category_id: Category.find(1).id, year: 1937,
            image_filename: "books/the_hobbit.png"
Book.create id: 3, title: "The Silmarillion", author: "J.R.R. Tolkien",
            category_id: Category.find(1).id, year: 1977,
            image_filename: "books/the_silmarillion.png"
Book.create id: 4, title: "Good Omens", author: "Terry Pratchett & Neil Gaiman",
            category_id: Category.find(1).id, year: 1990,
            image_filename: "books/good_omens.png"
Book.create id: 5, title: "Ender's Game", author: "Orson Scott Card",
            category_id: Category.find(2).id, year: 1985,
            image_filename: "books/enders_game.png"
