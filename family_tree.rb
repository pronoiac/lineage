require_relative "family"
require_relative "person"

# main
the_fam = Family.new

# let's parse the family tree
tree_file = open("family.txt", "r")
tree_file.each_line { |line|
    line = line.chomp
    next if line =~ /^#/
    child, parent = line.split(", ")
    puts "#{parent} begat #{child}"
    the_fam.add_parentage(child, parent)
}

p the_fam
