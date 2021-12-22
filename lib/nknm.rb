# frozen_string_literal: true

require "nknm/version"

# Nknm
module Nknm
end

%w[list lists nickname].each { |f| require_relative "./nknm/#{f}" }
