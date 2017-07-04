=begin
This baby takes a filename as input.

It then reads in a file

In said file will be a maze made of connected nodes presented in the following
format:

                      3[5, 6, 7, ...], ...
    > each entry consists of:
      > the node name represeted as a decimal number (3)
      > square brackets ([5, 6, 7]) containing further decimal numbers seperated
        by commas (representing connected nodes)
        > if one of these numbers is a 0, that means this particular node is the
          exit node.
    > each entry is proceeded by yet further commas (thank's for that lawrence!)

as output it will return a hash where the keys are nodes and the values
are in the following format:

        {key(node): [same node, 0 or "EXIT", keys of connected nodes ], }

for each node.

IT WILL ALSO (GYJVBFYDIGFHAUOI) IGNORE ALL F*CKING LINES THAT HAVE BEEN HASHED
OUT!

=end

#just reads in the file and returns a goddamn string.
def reader filename
  file = File.read filename
end

# this splits the file according to /n's makes a new array containing only
# array entries that don't contain #'s,
# deletes all array entries that consist of empty strings
# and finally returns a string, which should be the only entry left in narray
def isolate string
  array = string.split("\n")
  narray = (array.select {|str| !(str.include?("#"))})
  narray.delete("")
  narray[0]
end

def seperate str
  hash = {}

  array = str.split(/[\]]\,*/) # I LOVE REGEEEEEEEEEEXXXXXX

  array.each do |str|
    marray = str.split("[")

    node = marray[0].to_i

    prep = [node, 0, 0]

    # we need to convert all the string numbers to ints
    connections = marray[1].split(",").map { |element| element.to_i }

    # NOTE: if we want we can totally just remember the key here and elminate
    # solver alltogether
    # we don't need the extra 0 here because the first element of connections
    # (which is ordered) is already 0
    prep = [node, "EXIT"] if connections.include?(0)

    prep << connections

    hash[node] = prep.flatten
  end

  hash
end


#this just applies all the functions so we get the output we lookin' for
def converter filename
  file =  reader filename

  maze = isolate file

  hash = seperate maze

end
