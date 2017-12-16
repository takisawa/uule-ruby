require "uule/version"
require 'base64'

module Uule

  SPECIAL_KEY_TABLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"

  # see: https://moz.com/ugc/geolocation-the-ultimate-tip-to-emulate-local-search
  def self.encode(area_name)
    key = SPECIAL_KEY_TABLE[area_name.size]
    "w+CAIQICI#{key}#{Base64.strict_encode64(area_name)}"
  end

  def self.decode(uule)
    Base64.strict_decode64(uule[10 .. -1])
  end
end
