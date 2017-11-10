RSpec.describe BalancingAct::Server do
  describe "with valid attributes" do
    let(:s) { BalancingAct::Server.new("X", 2) }

    it "has a class of type Server" do
      expect(s.class).to eq(BalancingAct::Server)
    end

    it "has a 'name' attribute" do
      expect(s.name.class).to eq(String)
      expect(s.name).to eq("X")
    end

    it "has a 'size' attribute of type integer" do
      expect(s.size.class).to eq(Integer)
      expect(s.size).to eq(2)
    end
  end

  describe "with invalid attributes" do
    it "should raise TypeError if given invalid 'name'" do
      expect {
        BalancingAct::Server.new(5, 5)
      }.to raise_error(TypeError, /name/)
    end

    it "should raise TypeError if given invalid 'size'" do
      expect {
        BalancingAct::Server.new("X", "X")
      }.to raise_error(TypeError, /size/)
    end
  end
end
