class Family
    def initialize
        @family = {}
    end
    
    def add_parentage(child_name, parent_name)
        child = find_or_create(child_name)
        parent = find_or_create(parent_name)
        child.parent = parent_name
        parent.add_child(child_name)
    end
    
    def find_or_create(name)
        return @family[name] if @family.key?(name)
        @family[name] = Person.new(name)
        @family[name]
    end
end # /family

class Person
    def initialize(name)
        @name = name
        @parent = nil
        @children = []
    end
    
    def name
        @name
    end
    
    def parent=(rent)
        @parent = rent
    end
    
    def add_child(child_name)
        @children << child_name
    end
end # /person

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
