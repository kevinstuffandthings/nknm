# frozen_string_literal: true

module Nknm
  module Lists
    class Directory < Nknm::List
      attr_reader :path

      def initialize(path, include_files: true, include_subdirs: true)
        @path = path
        @include_files, @include_subdirs = include_files, include_subdirs
      end

      def items
        @_items ||= Dir[File.join(path, "*")]
          .select { |i| include?(i) }
          .map { |i| Entry.new(i) }
      end

      private

      def include?(item)
        (@include_files || (!File.file?(item))) && (@include_subdirs || (!File.directory?(item)))
      end

      class Entry
        attr_reader :path
        alias_method :to_s, :path

        def initialize(path)
          @path = path
        end

        def to_word
          @_to_word ||= File.basename(path).downcase
        end
      end
    end
  end
end
