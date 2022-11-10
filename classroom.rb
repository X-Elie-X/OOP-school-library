class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize_lambda
    @label = label
    @students = []
  end

  def adding_student(student)
    @students.push(student)
    student.classroom = self
  end
end
