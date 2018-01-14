class ArrivalService

  def self.build
    new
  end

  def call(number)
    Book.order(created_at: :desc).limit(number)
  end
end