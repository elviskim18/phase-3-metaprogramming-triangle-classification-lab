class Triangle
  # write code here
  attr_reader :length_a, :length_b,:length_c
  def initialize (length_a,length_b,length_c)
    @length_a = length_a
    @length_b = length_b
    @length_c = length_c
  end

  def kind
    validate
    if length_a == length_b && length_b ==length_c
      :equilateral
    elsif length_a == length_b || length_b  == length_c || length_c == length_a 
      :isosceles
    else  
      :scalene
    end
  end

  def validate
    true_triangle = [(length_a + length_b > length_c), (length_a + length_c > length_b),(length_b + length_c > length_a)]
    [length_a,length_b,length_c].each do |side|
      true_triangle << false if side <= 0
      raise TriangleError if true_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
    def message
      "Triangle inequality failed"
    end
  end


end
