require_relative "family"
require_relative "person"
# require "byebug"

# main
the_fam = Family.new

# let's parse the family tree
tree_file = open("family.txt", "r")
tree_file.each_line { |line|
    line = line.chomp
    next if line =~ /^#/
    child, parent = line.split(", ")
    # puts "#{parent} begat #{child}"
    the_fam.add_parentage(child, parent)
}

def menu
    puts <<EOM
What do you want me to do?
    1. Given a name, I'll tell you their grandparent.
    2. List people without siblings.
    3. List people without children.
    4. Tell you who has the most grandchildren.
    5. Draw the family tree. (not available)
    6 / x / q. exit
EOM
    print "Choice? "
    gets.chomp
end # /menu

prompting = true
while prompting
    choice = menu
    case choice
    when "1" # get grandparent for someone
    when "2" # list of no siblings
    when "3" # list of no children
    when "4" # who has most grandchildren?
    when "5" # draw family tree
    when "6", "q", "x" # exit
        puts "Exiting."
        prompting = false
    else # not recognized
        puts "Choice not recognized. Options: [123456q]"
    end
end # /prompting for choice
