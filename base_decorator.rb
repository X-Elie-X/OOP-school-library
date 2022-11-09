require './nameable'
class Base < Nameable
  attr_accessor :nameable

  @nameable = nameable

  def correct_name
    @nameable.correct_name
  end
end
