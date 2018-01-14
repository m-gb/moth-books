class ArrivalService

  def call(number)
    Book.order(created_at: :desc).limit(number)
  end
end
