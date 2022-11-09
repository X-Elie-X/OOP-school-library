require './base_decorator'

class CapitalizeDecorator < Base
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Base
  def correct_name
    @nameable.correct_name.strip[0...9]
  end
end
