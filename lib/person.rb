class Person
    attr_reader :name, :children, :parent
    
    def initialize(name)
        @name = name
        @parent = nil
        @children = []
    end
    
    
    def add_child(child)
        @children << child unless @children.include?(child)
    end
    
    def add_parent(parent)
        @parent = parent
    end
end # /person
