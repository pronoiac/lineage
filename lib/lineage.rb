require_relative "family"
require_relative "person"
# require "byebug"

# main
@the_fam = Family.new

def parse_tree(family, filename)
    # let's parse the family tree
    tree_file = open("family.txt", "r")
    tree_file.each_line { |line|
        line = line.chomp
        next if line =~ /^#/ || line =~ /^\s*$/
        child, parent = line.split(", ")
        # puts "#{parent} begat #{child}"
        @the_fam.add_parentage(child, parent)
    }
end # /parse_tree

def menu
    puts <<EOM
What do you want to know?
    1. The grandparent of someone.
    2. Who has no siblings?
    3. Who has no children?
    4. Who has the most grandchildren?
    5. Draw the family tree. (not available)
    6. Exit (also: x and q)
EOM
    print "Choice? "
    gets.chomp
end # /menu


def list_members()
    puts @the_fam.list_members.sort.join(", ")
end


def show_grandparent()
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
    results = []
    @the_fam.list_members.each { |peep_name|
        peep = @the_fam.lookup(peep_name)
        rents = peep.parent
        if rents.nil? || rents.children.count == 1
            results << peep.name
        end
    }
    results
end


def list_no_children
    results = []
    @the_fam.list_members.each { |peep_name|
        peep = @the_fam.lookup(peep_name)
        results << peep.name if peep.children.empty?
    }
    results
end


def biggest_grandparent
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
    return [biggest_gp, most_gc]
end


parse_tree(@the_fam, "family.txt")
prompting = (__FILE__ == $0)
# will be false if run via rspec
while prompting
    choice = menu
    case choice
    when "1" # get grandparent for someone
        puts "Showing a grandparent."
        show_grandparent
    when "2" # list of no siblings
        puts "Listing members without siblings."
        puts list_no_siblings.sort.join(", ")
    when "3" # list of no children
        puts "Listing members without children."
        puts list_no_children.sort.join(", ")
    when "4" # who has most grandchildren?
        puts "Who has the most grandchildren?"
        biggest_gp, most_gc = biggest_grandparent
        puts "#{biggest_gp} has the most grandchildren, at #{most_gc}."
    when "5" # draw family tree
        puts "Feature not implemented!"
    when "6", "q", "x" # exit
        puts "Exiting."
        prompting = false
    else # not recognized
        puts "Choice not recognized. Options: [123456q]"
    end
end # /prompting for choice
