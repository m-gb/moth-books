# Moth Books
## Description
This is an ongoing project for an online book store called Moth Books.

It's designed as a monolithic Ruby on Rails web application using several libraries:
- Bootstrap and jQuery gems for designing the store interface
- Devise gem for user management
- MySQL gem

## Features
Anyone can add books to their cart, but to make an order, they will need to sign up.

Once a user is signed in, the cart will retrieve the books from before signing in.

Upon signing out, all books in the cart will be saved to the database.

Next time the user signs in, the cart will merge all saved books and newly added books before signing in.

When a user wants to make an order, they will be asked for shipping information.

Upon successfully making an order, a list of recommended books based on the last chosen categories will be displayed.

Users can also access their order history through a menu in the header.

The bestsellers carousel will automatically update based on completed orders.

Finally, there is also a rake task called "cleanup" for removing old carts from the database.

## Development
- Install and run MySQL
- Configure and run the web application:
    - Install the dependencies:
    ```bash
    moth-books $ bundle install
    ```
    - Populate the database:
    ```bash
    moth-books $ rails db:create
    ```
    - Create the database:
    ```bash
    moth-books $ rails db:seed
    ```
    - Run the application:
    ```bash
    moth-books $ rails s
    ```
    - Go to http://localhost:3000

## Testing
In order to run the tests:
```bash
moth-books $ bundle exec rspec
```
