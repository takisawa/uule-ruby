# frozen_string_literal: true

require 'uule/version'
require 'base64'
require 'csv'

module Uule
  # see: https://moz.com/ugc/geolocation-the-ultimate-tip-to-emulate-local-search

  SPECIAL_KEY_TABLE = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_'
  LOCATION_CSV_PATH = File.join(File.dirname(__FILE__), '..', 'data', 'AdWords API Location Criteria 2017-11-02.csv')

  class InvalidLocationCanonicalNameError < StandardError
    def initialize(name)
      @name = name
    end

    def to_s
      "`#{@name}` is not included in the Location Canonical Name list."
    end
  end

  class << self
    # @param location_canonical_name [String]
    # @return [String] uule parameter string
    def encode(location_canonical_name)
      validates_location_canonical_name(location_canonical_name)

      key = SPECIAL_KEY_TABLE[location_canonical_name.size]
      "w+CAIQICI#{key}#{Base64.strict_encode64(location_canonical_name)}"
    end

    # @param uule [String]
    # @return [String] location canonical name
    def decode(uule)
      Base64.strict_decode64(uule[10..-1])
    end

    private

    def validates_location_canonical_name(name)
      CSV.open(LOCATION_CSV_PATH) do |csv|
        csv.shift # header

        csv.each do |row|
          return true if row[2] == name
        end
      end

      raise InvalidLocationCanonicalNameError.new(name)
    end
  end
end
