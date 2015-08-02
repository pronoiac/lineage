require_relative "person"

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
    
    def list_members
        return @family.keys
    end
    
    def lookup(name)
        return @family[name] if @family.key?(name)
        false
    end
end # /family
