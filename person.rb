class Person
    attr_accessor :parent
    attr_reader :name, :children
    
    def initialize(name)
        @name = name
        @parent = nil
        @children = []
    end
    
    
    def add_child(child)
        @children << child
    end
end # /person
