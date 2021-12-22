# frozen_string_literal: true

module Nknm
  class List
    module Selectors
      class Terminal < Nknm::List::Selector
        def selection
          items.each_with_index { |s, i| puts "#{i + 1}) #{s}" }
          $stdout.write "? "
          idx = $stdin.readline.to_i - 1
          items[idx] if idx >= 0
        end
      end
    end
  end
end
