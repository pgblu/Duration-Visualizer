require_relative 'dur_visualizer'

puts "What integer would you like to explode?"
durelements = gets.chomp.to_i
ok_user = false
my_array = ExplodableArray.new
(1..durelements).to_a.each do |num|
  my_array << num
end

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
puts "Give range of values"
puts "Starting value?"
start_val = gets.chomp.to_i
puts "Ending value?"
end_val = gets.chomp.to_i
puts ""
start_val.upto(end_val) do |value|
  g = value.get_exploder_values
  print value.to_s + "   " + g.length.to_s + "\n"
end
=end
