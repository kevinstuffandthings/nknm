# frozen_string_literal: true

module Nknm
  class List
    class Matches
      include Enumerable
      attr_reader :items

      def initialize(items = nil)
        @items = Array(items).compact
      end

      def each
        items.each { |i| yield i }
      end

      # Is this set of matches empty?
      # @return [Boolean]
      def empty?
        items.length == 0
      end

      # Does this set of matches contain a single item?
      # @return [Boolean]
      def single?
        items.length == 1
      end
    end
  end
end
