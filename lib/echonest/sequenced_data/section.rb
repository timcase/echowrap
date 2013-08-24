module Echowrap
    class Section < Echowrap::SequencedData
      attr_reader :loudness_start, :loudness_max_time, :loudness_max,
                  :piches, :timbre
    end
end
