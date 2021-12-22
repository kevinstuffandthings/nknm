# frozen_string_literal: true

module Nknm
  class List
    module Selectors
      describe Terminal do
        subject { described_class.build(%w[one two three four]) }

        it "is a selector, through and through" do
          expect(subject).to be_instance_of described_class
          expect(subject).to be_a Nknm::List::Selector
        end

        describe "#selection" do
          before(:each) do
            expect(subject).to receive(:puts).with("1) one").ordered
            expect(subject).to receive(:puts).with("2) two").ordered
            expect(subject).to receive(:puts).with("3) three").ordered
            expect(subject).to receive(:puts).with("4) four").ordered
            expect($stdout).to receive(:write) do |prompt|
              expect(prompt).to include("?")
              expect(prompt).not_to include("\n")
            end
          end

          it "returns no selection with an empty response" do
            expect($stdin).to receive(:readline).and_return nil
            expect(subject.selection).to be nil
          end

          it "returns no selection for an invalid response" do
            expect($stdin).to receive(:readline).and_return "x"
            expect(subject.selection).to be nil
          end

          it "returns the proper selection to correspond to the provided number" do
            expect($stdin).to receive(:readline).and_return "3"
            expect(subject.selection).to eq "three"
          end
        end
      end
    end
  end
end
