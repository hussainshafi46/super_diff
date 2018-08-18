module SuperDiff
  class NoOperationalSequencerAvailableError < StandardError
    def self.create(expected, actual)
      allocate.tap do |error|
        error.expected = expected
        error.actual = actual
        error.send(:initialize)
      end
    end

    attr_accessor :expected, :actual

    def initialize
      super(<<-MESSAGE)
There is no operational sequencer available to handle an "expected" value of
type #{expected.class} and an "actual" value of type #{actual.class}.
      MESSAGE
    end
  end
end
