# frozen_string_literal: true

module Nknm
  module Lists
    describe Names do
      subject { described_class.new(["Flurp", "bloop bloop", "MITTENS!"]) }

      describe "#items" do
        let(:names) { subject.items.map(&:to_s) }
        let(:words) { subject.items.map(&:to_word) }

        it "returns all the names it was given" do
          expect(names).to match_array [
            "Flurp",
            "bloop bloop",
            "MITTENS!"
          ]
        end

        it "can translate the entries into words" do
          expect(words).to match_array [
            "flurp",
            "bloop bloop",
            "mittens!"
          ]
        end
      end

      describe "#matches_for" do
        it "will respond to #matches_for, and that's good enough" do
          expect(subject).to respond_to :matches_for
        end
      end
    end
  end
end
