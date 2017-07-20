require_relative "generator.rb"

def to_string hash
  str = ''

  hash.each do |k, v|
    str += "#{k}#{v},".gsub(/[ ]/, "") + " "
  end

  str[0..-3]
end
