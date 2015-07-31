class Family
    def initialize
        @family = {}
    end
    
    def add(person)
        @family[person.name] = person
    end
end # /family

class Person
    def initialize(name, parent=nil)
        @name = name
        @parent = parent
    end
    
    def name
        @name
    end
end # /person

the_fam = Family.new

# let's parse the family tree
tree_file = open("family.txt", "r")
tree_file.each_line { |line|
    line = line.chomp
    next if line =~ /^#/
    child, parent = line.split(", ")
    puts "#{parent} begat #{child}"
    peep = Person.new(child, parent)
    the_fam.add(peep)
}

p the_fam
