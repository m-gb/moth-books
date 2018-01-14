class BestsellerService

  # Returns a given number of bestsellers by ordered book count in the database.
  def call(number)
    bestsellers_hash = CartItem.joins(cart: :order).select(:book_id)
                               .group(:book_id).order('count_book_id desc')
                               .limit(number).count
    books = []
    bestsellers_hash.each do |key,value|
      books << Book.find(key) # Uses the book_id in the hash and finds the corresponding book.
    end
    books
  end
end
