# frozen_string_literal: true

module Nknm
  class List
    # :nocov:
    def items
      raise NotImplementedError
    end
    # :nocov:

    def matches_for(nickname)
      Matches.new(items.select { |i| nickname.for?(i.to_word) })
    end
  end
end

require_relative "./list/matches"
require_relative "./list/selector"
