# frozen_string_literal: true

module Nknm
  module Lists
    class Names < Nknm::List
      def initialize(items)
        @names = Array(items).compact
      end

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

        def to_word
          @_to_word ||= name.downcase
        end
      end
    end
  end
end
