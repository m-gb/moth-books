# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

Category.delete_all
Category.create id: 1, name: "Fantasy"
Category.create id: 2, name: "Science Fiction"
Category.create id: 3, name: "Horror"
Category.create id: 4, name: "Crime"

Book.delete_all
Book.create id: 1, title: "The Lord of the Rings Trilogy", author: "J.R.R. Tolkien",
            category_id: Category.find(1).id, year: 1954,
            image_filename: "books/the_lord_of_the_rings_trilogy.png",
            price: 10.99, description: "The Lord of the Rings is an epic high-fantasy novel written by English author J. R. R. Tolkien. The story began as a sequel to Tolkien's 1937 fantasy novel The Hobbit, but eventually developed into a much larger work. Written in stages between 1937 and 1949, The Lord of the Rings is one of the best-selling novels ever written, with over 150 million copies sold. The title of the novel refers to the story's main antagonist, the Dark Lord Sauron, who had in an earlier age created the One Ring to rule the other Rings of Power as the ultimate weapon in his campaign to conquer and rule all of Middle-earth. From quiet beginnings in the Shire, a hobbit land not unlike the English countryside, the story ranges across Middle-earth, following the course of the War of the Ring through the eyes of its characters, not only the hobbits Frodo Baggins, Samwise \"Sam\" Gamgee, Meriadoc \"Merry\" Brandybuck and Peregrin \"Pippin\" Took, but also the hobbits' chief allies and travelling companions: the Men Aragorn son of Arathorn, a Ranger of the North, and Boromir, a Captain of Gondor; Gimli son of Glóin, a Dwarf warrior; Legolas Greenleaf, an Elven prince; and Gandalf, a Wizard."


CSV.foreach(Rails.root.join("db/seeds_data/books.csv"), headers: true) do |row|
  Book.find_or_create_by(id: row[0], title: row[1], author: row[2], price: row[3], category_id: row[4], year: row[5], image_filename: row[6])
end
