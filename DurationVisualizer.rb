
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

class Array
  def rot(n)
    m = n % self.length
    self.last(self.length - m) + self.first(m)
  end

  def explode(n)
  	this = []
  	1.upto(self.length) do |x|
  		k = self[(x* n-1 ) % self.length]
  		this.push(k)
  	end
  	return this
  end

  def collect_explosions
  	exploded_hash = Hash.new
  	selection = self.length.get_exploder_values
  	selection.each {|x| exploded_hash.store(x, self.explode(x))}
  	return exploded_hash
  end

end

def exploded_array(input_array, index, startval, endval, precision)
	totval = 0.0
	thing = []
	this = []
	runningtot = []
	1.upto((input_array.length)) do |x|
		k=input_array[(x*index-1) % input_array.length]
		nextvalue = startval * (endval/startval)**((k-1)/(input_array.length-1.to_f))
		nexttrunc = nextvalue.round_to(precision)
		this.push(nexttrunc)
		totval+=nextvalue
		runningtot.push(totval.round_to(precision))
	end
	thing.push(this)
	tottrunc = totval.round_to(precision)
	thing.push(tottrunc)
	thing.push(runningtot)
end

my_array = Array.new
puts "What integer would you like to explode?"
durelements = gets.chomp!.to_i
ok_user = false
1.upto(durelements) { |x| my_array.push(x) }

while ok_user == false
	my_array.shuffle!.display
	puts "Is this ok?"
	if /[yY]/.match(gets.chomp)
		ok_user == true
		break
	end
end

hashout = my_array.collect_explosions
hashout.display
puts "\nReady to reverse and rotate..."



=begin
puts "Provide the starting value"
initial = gets.chomp!.to_f
puts "Provide the ending value"
final = gets.chomp!.to_f
puts "Provide the precision"
places = gets.chomp!.to_f
while ok_user == false
	my_array = [1,2,3,4,5,6,8,9,10,11,12,13].shuffle
	my_array.push(7)
	my_array.display
	puts "Is this ok?"
	if /[yY]/.match(gets.chomp)
		ok_user == true
		break
	end
end
puts ""
1.upto(12) {|x| puts exploded_array(my_array, x, initial, final, places).display
	}
=end