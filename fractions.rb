class Frac
  attr_accessor :num,:den
  def initialize(num,denom)
    @num = num
    @den = denom
    #reduce!()
  end
  def to_s
    return "(#{@num}/#{@den})"
  end
  def inspect
    "<Fraction:" + to_s + ">"
  end
  def *(f)
    return Frac.new(@num * f.num,@den * f.den)
  end
  def +(f)
    lc = @den.lcm(f.den)
    f1 = toden(lc)
    f2 = f.toden(lc)
    return Frac.new(f1.num + f2.num,lc)
  end
  def -(f)
    lc = @den.lcm(f.den)
    f1 = toden(lc)
    f2 = f.toden(lc)
    return Frac.new(f1.num - f2.num,lc)
  end
  
  # converts the fraction to use a specific denominator
  def toden(de)
    mult = de / @den
    return Frac.new(mult * @num,de)
  end
  
  # reduce to lowest terms
  def reduce!()
    gc = @num.gcd(@den)
    @num = @num/gc
    @den = @den/gc
  end
  def reduce()
    gc = @num.gcd(@den)
    return Frac.new(@num/gc,@den/gc)
  end
  
  # a probability union
  def prob_union(f)
    sum = self + f
    both = self * f
    return sum - both
  end
end
def frac(n,d)
  return Frac.new(n,d)
end