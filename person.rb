require './nameable'
require './rental'
class Person < Nameable
  attr_reader :id
  attr_writer :name, :age, :rental

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def can_use_services?
    @parent_permission || is_of_age?
  end
  private :to_age?
  def to_age?
    @age >= 18
  end

  def correct_name
    @name
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end
end
