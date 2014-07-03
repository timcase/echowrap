module Echowrap
  class Version
    MAJOR = 0 unless defined? Echowrap::Version::MAJOR
    MINOR = 1 unless defined? Echowrap::Version::MINOR
    PATCH = 4 unless defined? Echowrap::Version::PATCH
    PRE = nil unless defined? Echowrap::Version::PRE

    class << self

      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end

    end

  end
end
