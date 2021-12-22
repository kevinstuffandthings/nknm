# frozen_string_literal: true

module Nknm
  class List
    describe Selector do
      describe "::build" do
        let(:selector) { described_class }
        let(:input) { items }
        subject { selector.build(input) }

        context "invalid items" do
          let(:items) { double }

          it "will raise an error if you attempt to build it with something unselectable" do
            expect { subject }.to raise_error described_class::UnselectableItemsError
          end
        end

        context "valid items" do
          let(:selector) { Class.new(described_class) }

          shared_examples_for("a selector with items") do
            it "has the items it was passed, regardless of whether they were wrapped in matches or not" do
              expect(subject.items).to eq items
            end
          end

          shared_examples_for("a boring item selector") do
            it "does not build the specific selector, because it doesn't need to" do
              expect(subject).not_to be_a selector
            end

            it "builds a simple selector directly" do
              expect(subject).to be_instance_of described_class
            end

            it_behaves_like "a selector with items"
          end

          shared_examples_for("a multi item selector") do
            it "builds the specific selector" do
              expect(subject).to be_a selector
            end

            it_behaves_like "a selector with items"
          end

          context "empty items" do
            let(:items) { [] }

            it_behaves_like "a boring item selector"

            context "as matches" do
              let(:input) { Nknm::List::Matches.new(items) }

              it_behaves_like "a boring item selector"
            end
          end

          context "single item" do
            let(:items) { ["eight"] }

            it_behaves_like "a boring item selector"

            context "as matches" do
              let(:input) { Nknm::List::Matches.new(items) }

              it_behaves_like "a boring item selector"
            end
          end

          context "multi item" do
            let(:items) { %w[two four six] }

            it_behaves_like "a multi item selector"

            context "as matches" do
              let(:input) { Nknm::List::Matches.new(items) }

              it_behaves_like "a multi item selector"
            end
          end
        end
      end

      describe "#selection" do
        let(:items) { [] }
        subject { described_class.send(:new, items) }

        it "gives you nothing with an empty item list" do
          expect(subject.selection).to be_nil
        end

        context "with items" do
          let(:items) { %w[stuff things whatever] }

          it "will just give you the first item" do
            expect(subject.selection).to eq "stuff"
          end
        end
      end
    end
  end
end
