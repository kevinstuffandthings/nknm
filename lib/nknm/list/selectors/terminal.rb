# frozen_string_literal: true

module Nknm
  class List
    module Selectors
      class Terminal < Nknm::List::Selector
        # Generate a menu within the terminal that allows a user to
        # select the desired item from the list.
        # @return [Object] the user-selected option
        def selection
          items.each_with_index { |s, i| stream.puts "#{i + 1}) #{s}" }
          stream.write "? "
          idx = $stdin.readline.to_i - 1
          items[idx] if idx >= 0
        end

        private

        def stream
          @_stream ||= $stderr
        end
      end
    end
  end
end
