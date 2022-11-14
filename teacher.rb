require './person'
class Teacher < Person
  def initialize( age, name = 'Unknown',specialization='na')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
