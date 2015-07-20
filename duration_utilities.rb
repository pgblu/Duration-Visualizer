class Numeric
  def round_to( decimals=0 )
    factor = 10.0**decimals
    (self*factor).round / factor
  end
end

class Integer
  def get_exploder_values
    primevals = Array.new
    1.upto(self / 2) { |x|
      if self.relprime(x)
        primevals.push(x)
      end
    }
    return primevals
  end

  def relprime(other)
    t = Rational(self,other)
    return t.numerator == self
  end
end