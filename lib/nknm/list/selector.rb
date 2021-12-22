# frozen_string_literal: true

module Nknm
  class List
    class Selector
      UnselectableItemsError = Class.new(StandardError)

      def self.build(items)
        matches = if items.is_a?(Array)
          Nknm::List::Matches.new(items)
        elsif items.is_a?(Nknm::List::Matches)
          items
        end
        raise UnselectableItemsError if matches.nil?

        selector = matches.single? || matches.empty? ? Nknm::List::Selector : self
        selector.new(matches.items)
      end

      attr_reader :items

      def selection
        items.first
      end

      protected

      def initialize(items)
        @items = items
      end
    end
  end
end

%w[terminal].each { |f| require_relative "./selectors/#{f}" }
