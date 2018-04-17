require 'minitest/autorun'
require 'aircall'
require 'default_aircall'
require 'default_tests'

module TestAircall
  describe Aircall::Numbers do
    def self.number_by_id
      @number_by_id ||= DefaultAircall::AIRCALL.numbers.get_by_id(ENV['TEST_DEFAULT_NUMBER'])
    end

    DefaultTest::Run.('number_by_id')
  end
end