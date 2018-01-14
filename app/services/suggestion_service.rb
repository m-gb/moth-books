class SuggestionService

  def call(order)
    categories = []
    Cart.find(order.cart_id).cart_items.each do |cart_item| 
      categories << cart_item.book.category
    end
    books = []
    categories.uniq.each do |category|
      category.books.each do |book|
        books << book
      end
    end
    books
  end
end
