require 'rspec'
require 'lineage'

describe "Testing lineage, main app" do
    let(:fam) {Lineage.new}
    
    before(:each) do
        fam.parse_tree("family.txt")
    end

    context "checking data parsing" do
        it "checking number of members" do
            expect(fam.list_members.count).to be(14)
        end
    end
    
    context "checking #lookup_grandparent"
        it "checking Kevin" do
            expect(fam.lookup_grandparent("Kevin")).to eq "" +
                "Nancy is the grandparent of Kevin."
        end
        
        it "checking Jill" do
            expect(fam.lookup_grandparent("Jill")).to eq "" +
                "The grandparent of Jill is unknown."
        end
        
        it "checking unknown" do
            expect(fam.lookup_grandparent("Vandelay")).to eq "" +
                "Unknown member Vandelay."
        end
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
