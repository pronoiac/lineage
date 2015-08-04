require 'rspec'
require 'family'

RSpec.describe Family do
    let(:fam) {Family.new}

    context "checking list_members" do
        it "should handle empty family tree" do
            expect(fam.list_members).to be_empty
        end
    end

    context "checking add_parentage" do
        it "should add to members" do
            fam.add_parentage("alice", "bob")
            expect(fam.list_members.sort).to eq ["alice", "bob"]
        end
    end

    context "checking find_or_create" do
        it "should add to members" do
            alice = fam.find_or_create("alice")
            expect(fam.list_members).to eq ["alice"]
        end

        it "should find a new member" do
            alice = fam.find_or_create("alice")
            expect(fam.find_or_create("alice")).to be alice
        end
    end

    context "checking lookup" do
        it "should handle empty family tree" do
            expect(fam.lookup("alice")).to be false
        end

        it "should find a new member from find_or_create" do
            alice = fam.find_or_create("alice")
            expect(fam.lookup("alice")).to be alice
        end

        it "should find a new member from add_parentage" do
          fam.add_parentage("alice", "bob")
          expect(fam.lookup("alice").name).to eq "alice"
        end
    end
end
