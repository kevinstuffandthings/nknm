# frozen_string_literal: true

module Nknm
  describe List do
    let(:item1) { double(to_word: "x1") }
    let(:item2) { double(to_word: "y2") }
    let(:item3) { double(to_word: "z3") }
    before(:each) { allow(subject).to receive(:items).and_return [item1, item2, item3] }

    describe "#matches_for" do
      let(:nickname) { instance_double(Nknm::Nickname) }
      let(:matches) { subject.matches_for(nickname) }

      it "will build a list of matches for the items that match the nickname" do
        expect(nickname).to receive(:for?).with("x1").and_return true
        expect(nickname).to receive(:for?).with("y2").and_return false
        expect(nickname).to receive(:for?).with("z3").and_return true

        expect(matches).to be_a described_class::Matches
        expect(matches.items).to match_array [item1, item3]
      end
    end
  end
end
