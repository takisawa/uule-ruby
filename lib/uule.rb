# frozen_string_literal: true

# see: https://moz.com/ugc/geolocation-the-ultimate-tip-to-emulate-local-search

require 'uule/version'
require 'base64'

module Uule
  SPECIAL_KEY_TABLE = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_'

  class << self
    # @param location_canonical_name [String]
    # @return [String] uule parameter string
    def encode(location_canonical_name)
      key = SPECIAL_KEY_TABLE[location_canonical_name.size]
      "w+CAIQICI#{key}#{Base64.strict_encode64(location_canonical_name)}"
    end

    # @param uule [String]
    # @return [String] location canonical name
    def decode(uule)
      Base64.strict_decode64(uule[10..-1])
    end
  end
end
