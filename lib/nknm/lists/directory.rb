# frozen_string_literal: true

module Nknm
  module Lists
    class Directory < Nknm::List
      attr_reader :path

      # Create a new list based on a filesystem directory.
      # @param path [String] the directory path to examine
      # @param include_files [Boolean] should files be included?
      # @param include_subdirs [Boolean] should directories be included?
      # @return [Directory]
      def initialize(path, include_files: true, include_subdirs: true)
        @path = path
        @include_files, @include_subdirs = include_files, include_subdirs
      end

      # Get all the desired items from the specified directory.
      # @return [Array<Entry>]
      def items
        @_items ||= Dir[File.join(path, "*")]
          .select { |i| include?(i) }
          .map { |i| Entry.new(i) }
      end

      private

      def include?(item)
        (@include_files || !File.file?(item)) && (@include_subdirs || !File.directory?(item))
      end

      class Entry
        attr_reader :path
        alias_method :to_s, :path

        def initialize(path)
          @path = path
        end

        # Turn this entry into a word matchable by a nickname.
        # @return [String]
        def to_word
          @_to_word ||= File.basename(path).downcase
        end
      end
    end
  end
end
