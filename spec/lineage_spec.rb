require 'rspec'
require 'lineage'

describe "Testing lineage, main app" do
    let(:fam) {Lineage.new}


    before(:each) do
        fam.parse_tree("family.txt")
    end

    context "checking data parsing"
        

    context "checking #show_grandparent"
        # for Kevin: Nancy
        # for Jill: unknown
        # for, say, Vandelay: hmm.

    context "checking #list_no_siblings" do
        it "check results" do
            expect(fam.list_no_siblings).to match_array(
                ["Kevin", "Mary", "Nancy"])
        end
    end

    context "checking #list_no_children" do
        it "check results" do
            expect(fam.list_no_children).to match_array(
                ["Patrick", "Robert", "Mary", "Samuel", "Aaron", 
                "Catherine", "Joseph", "Adam"])
        end
    end

    context "checking #biggest_grandparent" do
        it "check results" do
            expect(fam.biggest_grandparent).to contain_exactly("Jill", 4)
        end
    end
end
