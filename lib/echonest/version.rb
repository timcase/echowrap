module Echonest
  class Version
    MAJOR = 0 unless defined? Echonest::Version::MAJOR
    MINOR = 0 unless defined? Echonest::Version::MINOR
    PATCH = 1 unless defined? Echonest::Version::PATCH
    PRE = nil unless defined? Echonest::Version::PRE

    class << self

      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end

    end

  end
end
