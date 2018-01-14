# Moth Books

This is an ongoing project for an online shop selling second-hand books called "Moth Books".

Anyone can add books to their cart, but to make an order, they will need to sign up.

Once a user is signed in, the cart will retrieve the books from before signing in.

Upon signing out, all books in the cart will be saved to the database.

Next time the user signs in, the cart will merge all saved books and newly added books before signing in.

When a user wants to make an order, they will be asked for shipping information.

Upon successfully making an order, a list of recommended books based on the last chosen categories will be displayed.

Users can also access their order history through a menu in the header.

The bestsellers carousel will automatically update based on completed orders.

Using the following tools:
- Ruby on Rails
- devise gem
- Bootstrap gem
- MySQL
- JavaScript
- HTML, CSS
- Photoshop

Finally, there is also a rake task called "cleanup" for removing old carts from the database.
