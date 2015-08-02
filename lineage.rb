require_relative "family"
require_relative "person"
# require "byebug"

# main
@the_fam = Family.new

# let's parse the family tree
tree_file = open("family.txt", "r")
tree_file.each_line { |line|
    line = line.chomp
    next if line =~ /^#/
    child, parent = line.split(", ")
    # puts "#{parent} begat #{child}"
    @the_fam.add_parentage(child, parent)
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


def list_members()
    results = []
    @the_fam.list_members.each { |peep_name|
        peep = @the_fam.lookup(peep_name)
        results << peep.name
    }
    puts results.sort.join(", ")
end


def show_grandparent()
    puts "Showing a grandparent."
    choice = false
    
    while !choice
        puts "Whose grandparent do you want to know?"
        print '("list" for family members, or enter to return to main menu) '
        name = gets.chomp
        return if name == "" # back to main menu
        if name == "list"
            puts "Known family members: "
            list_members
        else 
            choice = @the_fam.lookup(name)
            if !choice
                puts "Unknown member."
            end
        end
    end # /choice

    parent = @the_fam.lookup(choice.parent)
    
    puts "#{parent.parent} is the grandparent of #{name}.\n"
end


def list_no_siblings
    puts "Listing members without siblings."
    results = []
    @the_fam.list_members.each { |peep_name|
        peep = @the_fam.lookup(peep_name)
        rents = @the_fam.lookup(peep.parent)
        results << peep.name if rents.children.count == 1 # only one child
        # TODO: Nancy's left out here
    }
    puts results.sort.join(", ")
end


def list_no_children
    puts "Listing members without children."
    results = []
    @the_fam.list_members.each { |peep_name|
        peep = @the_fam.lookup(peep_name)
        results << peep.name if peep.children.empty?
    }
    puts results.sort.join(", ")
end


prompting = true
while prompting
    choice = menu
    case choice
    when "1" # get grandparent for someone
        show_grandparent
    when "2" # list of no siblings
        list_no_siblings
    when "3" # list of no children
        list_no_children
    when "4" # who has most grandchildren?
    when "5" # draw family tree
    when "6", "q", "x" # exit
        puts "Exiting."
        prompting = false
    else # not recognized
        puts "Choice not recognized. Options: [123456q]"
    end
end # /prompting for choice
