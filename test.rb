
puts "what is your favoriet aminal?"

one = gets.chomp

count = 1

900.times do
  puts "#{count}: #{one}"
  count += 1
  sleep 0.3
end
