require 'rspec'
require 'person'

describe "#add_child" do
    it "should be able to able to name a child" do
        momma = Person.new("Momma")
        baby = Person.new("Baby")
        momma.add_child(baby)
        expect(momma.children.first.name).to eq "Baby"
    end
end
