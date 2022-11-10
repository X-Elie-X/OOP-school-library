require './rental'
class Book
  attr_accessor :title, :author, rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_book(person, date)
    Rental.new(date, person, self)
  end
end
