require 'rspec'
require 'person'

describe "Person" do
    let(:momma) {Person.new("Momma")}
    let(:baby) {Person.new("Baby")}

    before(:each) do
        momma.add_child(baby)
        baby.add_parent(momma)
    end

    it "can tell name of child" do
        expect(momma.children.first.name).to eq "Baby"
    end
    
    it "can tell name of parent" do
        expect(baby.parent.name).to eq "Momma"
    end
end
