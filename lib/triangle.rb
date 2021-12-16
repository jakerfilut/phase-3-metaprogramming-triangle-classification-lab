class Triangle
  attr_reader :a, :b, :c
  
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def valid?
    ([a, b, c].all?(&:positive?)) && (a + b > c && a + c > b && b + c > a)
  end

  def validate_triangle
    raise TriangleError unless valid?
  end

  class TriangleError < StandardError
  end

end
