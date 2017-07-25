require 'csv'

Book.create(title: "The Lord of the Rings Trilogy", author_id: Author.find_or_create_by(name: "J.R.R. Tolkien").id,
            category_id: Category.find_or_create_by(name: "Fantasy").id, year: 1954,
            image_filename: "books/the_lord_of_the_rings_trilogy.png",
            price: 10.99, description: "The Lord of the Rings is an epic high-fantasy novel written by English author J. R. R. Tolkien. The story began as a sequel to Tolkien's 1937 fantasy novel The Hobbit, but eventually developed into a much larger work. Written in stages between 1937 and 1949, The Lord of the Rings is one of the best-selling novels ever written, with over 150 million copies sold. The title of the novel refers to the story's main antagonist, the Dark Lord Sauron, who had in an earlier age created the One Ring to rule the other Rings of Power as the ultimate weapon in his campaign to conquer and rule all of Middle-earth. From quiet beginnings in the Shire, a hobbit land not unlike the English countryside, the story ranges across Middle-earth, following the course of the War of the Ring through the eyes of its characters, not only the hobbits Frodo Baggins, Samwise \"Sam\" Gamgee, Meriadoc \"Merry\" Brandybuck and Peregrin \"Pippin\" Took, but also the hobbits' chief allies and travelling companions: the Men Aragorn son of Arathorn, a Ranger of the North, and Boromir, a Captain of Gondor; Gimli son of Glóin, a Dwarf warrior; Legolas Greenleaf, an Elven prince; and Gandalf, a Wizard.")


CSV.foreach(Rails.root.join("db/seeds_data/books.csv"), headers: true) do |row|
  Book.create(title: row[0], author_id: Author.find_or_create_by(name: row[1]).id, price: row[2], category_id: Category.find_or_create_by(name: row[3]).id, year: row[4], image_filename: row[5], description: row[6])
end
