class Triangle
  attr_accessor :length_1, :length_2, :length_3

  def initialize(length_1, length_2, length_3)
    @length_1 = length_1
    @length_2 = length_2
    @length_3 = length_3
  end

  def inequality
    sides = [length_1, length_2, length_3]
    sides.any? {|side| side <= 0 } || sides[0] + sides[1] <= sides[2]
  end

  def kind
    if inequality
      raise TriangleError
    elsif length_1 + length_2 <= length_3 || length_2 + length_3 <= length_1 || length_1 + length_3 <= length_2
      raise TriangleError
    elsif length_1 == length_2 && length_1 == length_3
      :equilateral
    elsif length_1 == length_2 || length_1 == length_3 || length_2 == length_3
      :isosceles
    elsif length_1 != length_2 && length_3
      :scalene
    end
  end
    
  class TriangleError < StandardError
  
  end
end
