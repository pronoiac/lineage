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
