class StaticPagesController < ApplicationController
  def home
    # Returns 5 bestsellers by count in the database.
    sql_query = "SELECT book_id, COUNT(book_id) AS count FROM cart_items
                 GROUP BY book_id
                 ORDER BY count DESC
                 LIMIT 5;"
    query_hash = CartItem.connection.select_all(sql_query).to_hash
    book_ids = []
    query_hash.each do |result|
      book_ids << result["book_id"] # Returns the value of the book_id hash. Returned from db as string.
    end
    @books = []
    book_ids.each do |b_id|
      @books << Book.find(b_id)
    end

    # Returns last 10 books added to the db.
    sql_arrivals = "SELECT id FROM books
    ORDER BY created_at DESC
    LIMIT 10;"
    query_arrivals = Book.connection.select_all(sql_arrivals).to_hash
    arrival_ids = []
    query_arrivals.each do |result|
      arrival_ids << result["id"]
    end
    @arrivals = []
    arrival_ids.each do |b_id|
      @arrivals << Book.find(b_id)
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
