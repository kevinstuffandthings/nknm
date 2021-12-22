# frozen_string_literal: true

module Nknm
  class List
    describe Matches do
      context "empty" do
        it "is considered empty" do
          expect(subject).to be_empty
        end

        it "is not single" do
          expect(subject).not_to be_single
        end

        it "has nothing to iterate over" do
          count = 0
          subject.each { |i| count += 1 }
          expect(count).to eq 0
        end
      end

      context "single" do
        let(:item) { double }
        subject { described_class.new(item) }

        it "is not considered empty" do
          expect(subject).not_to be_empty
        end

        it "is single" do
          expect(subject).to be_single
        end

        it "can iterate over the one item" do
          count = 0
          subject.each do |i|
            expect(item).to eq item
            count += 1
          end
          expect(count).to eq 1
        end
      end

      context "multiple" do
        let(:items) { [double, double, double] }
        subject { described_class.new(items) }

        it "is not considered empty" do
          expect(subject).not_to be_empty
        end

        it "is not single" do
          expect(subject).not_to be_single
        end

        it "can iterate over the set of items" do
          subject.each_with_index do |item, i|
            expect(item).to eq items[i]
          end
        end
      end
    end
  end
end
