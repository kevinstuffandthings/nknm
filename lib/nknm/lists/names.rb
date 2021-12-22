# frozen_string_literal: true

module Nknm
  module Lists
    class Names < Nknm::List
      # Create a new list based on an array of items.
      # @param items [Array<String>]
      # @return [Names]
      def initialize(items)
        @names = Array(items).compact
      end

      # Get all the items included in the list.
      # @return [Array<Entry>]
      def items
        @_items ||= @names.map { |n| Entry.new(n) }
      end

      private

      class Entry
        attr_reader :name
        alias_method :to_s, :name

        def initialize(name)
          @name = name
        end

        # Turn this entry into a word matchable by a nickname.
        # @return [String]
        def to_word
          @_to_word ||= name.downcase
        end
      end
    end
  end
end
