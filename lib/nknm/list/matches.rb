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

      def item
        items.first if single?
      end

      def empty?
        items.length == 0
      end

      def single?
        items.length == 1
      end
    end
  end
end
