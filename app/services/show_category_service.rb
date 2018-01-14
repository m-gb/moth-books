class ShowCategoryService

  def call(category, params)
    Book.joins(:author).where(category_id: category.id)
    .paginate(page: params[:books_page])
    .order("authors.name")  end
end
