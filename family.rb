class Family
    def initialize
        @family = {}
    end
    
    def add(person)
        @family[person.name] = person
    end
end # /family

class Person
    def initalize(name, parent=nil)
        @name = name
        @parent = parent
    end
end # /person

# let's parse the family tree
tree_file = open("family.txt", "r")
tree_file.each_line { |line|
    line = line.chomp
    next if line =~ /^#/
    p line
}


