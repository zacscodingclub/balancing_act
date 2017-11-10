RSpec.describe BalancingAct::Balancer do
  describe "#process" do
    let(:input_one) { ["X:3"] }
    let(:input_two) { ["X:3", "Y:1"] }
    let(:input_three) { %w(A:3 B:2 C:4 D:4 E:1) }

    describe "outputs a single server name to stdout" do
      it "outputs to stdout" do
        expect {
          BalancingAct::Balancer.process(input_one)
        }.to output.to_stdout

        expect {
          BalancingAct::Balancer.process(input_two)
        }.to output.to_stdout

        expect {
          BalancingAct::Balancer.process(input_three)
        }.to output.to_stdout
      end

      describe "with a single input" do
        it "outputs a valid server name" do
          possible_servers = input_one.map { |i| i.split(':')[0] }.join

          expect {
            BalancingAct::Balancer.process(input_one)
          }.to output(/[#{possible_servers}]\n/).to_stdout
        end

        it "returns a BalancingAct::Server object" do
          processed = BalancingAct::Balancer.process(input_one)
          expect(processed.class).to eq(BalancingAct::Server)
        end
      end

      describe "with two inputs" do
        it "outputs a valid server name" do
          possible_servers = input_two.map { |i| i.split(':')[0] }.join

          expect {
            BalancingAct::Balancer.process(input_two)
          }.to output(/[#{possible_servers}]\n/).to_stdout
        end

        it "returns a BalancingAct::Server object" do
          processed = BalancingAct::Balancer.process(input_two)
          expect(processed.class).to eq(BalancingAct::Server)
        end
      end

      describe "with several inputs" do
        it "outputs a valid server name" do
          possible_servers = input_three.map { |i| i.split(':')[0] }.join

          expect {
            BalancingAct::Balancer.process(input_three)
          }.to output(/[#{possible_servers}]\n/).to_stdout
        end

        it "returns a BalancingAct::Server object" do
          processed = BalancingAct::Balancer.process(input_three)
          expect(processed.class).to eq(BalancingAct::Server)
        end
      end
    end
  end
end
