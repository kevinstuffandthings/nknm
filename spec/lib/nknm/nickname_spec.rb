# frozen_string_literal: true

module Nknm
  describe Nickname do
    describe "#for?" do
      {
        tng: [%w[tngtng things tenalgrap tingy], %w[nothing tognar torg]],
        s: [%w[ssss slim still sandy], %w[goop fsck t-shirt]]
      }.each do |nickname, (yes, no)|
        context "#{nickname}" do
          subject { described_class.new(nickname) }

          yes.each do |word|
            it "matches #{word}" do
              expect(subject.for?(word)).to be true
            end
          end

          no.each do |word|
            it "does not match #{word}" do
              expect(subject.for?(word)).to be false
            end
          end
        end
      end
    end
  end
end
