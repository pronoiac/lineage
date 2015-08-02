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
    puts @the_fam.list_members.sort.join(", ")
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

    parent = choice.parent
    if parent.nil? || parent.parent.nil?
        puts "The grandparent of #{name} is unknown."
    else
        puts "#{parent.parent.name} is the grandparent of #{name}.\n"
    end
end


def list_no_siblings
    puts "Listing members without siblings."
    results = []
    @the_fam.list_members.each { |peep_name|
        peep = @the_fam.lookup(peep_name)
        rents = peep.parent
        if rents.nil? || rents.children.count == 1
            results << peep.name
        end
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


def biggest_grandparent
    puts "Who has the most grandchildren?"
    most_gc = 0
    biggest_gp = ""
    @the_fam.list_members.each { |peep_name|
        gc_count = 0
        peep = @the_fam.lookup(peep_name)
        peep.children.each { |child|
            gc_count += child.children.count
        }
        if gc_count > most_gc
            biggest_gp = peep_name
            most_gc = gc_count
        end
    }
    puts "#{biggest_gp} has the most grandchildren, at #{most_gc}."
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
        biggest_grandparent
    when "5" # draw family tree
        puts "Feature not implemented!"
    when "6", "q", "x" # exit
        puts "Exiting."
        prompting = false
    else # not recognized
        puts "Choice not recognized. Options: [123456q]"
    end
end # /prompting for choice
