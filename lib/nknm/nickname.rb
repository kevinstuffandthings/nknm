# frozen_string_literal: true

module Nknm
  class Nickname
    attr_reader :text
    alias_method :to_s, :text

    def initialize(text)
      @text = text
    end

    def for?(word)
      regex.match?(word)
    end

    private

    def regex
      @_regex ||= Regexp.compile("^#{(text || "").to_s.downcase.chars.join(".*")}")
    end
  end
end
