class StaticPagesController < ApplicationController
  def home
    sql_query = "SELECT book_id, COUNT(book_id) AS count FROM cart_items
                 GROUP BY book_id
                 ORDER BY count DESC
                 LIMIT 5;"
    query_hash = CartItem.connection.select_all(sql_query).to_hash
    @book_ids = []
    query_hash.each do |result|
      @book_ids << result["book_id"] # returned from db as string
    end
    @books = []
    @book_ids.each do |b_id|
      @books << Book.find(b_id)
    end

    

  end

  def help
  end

  def about
  end

  def contact
  end
end
