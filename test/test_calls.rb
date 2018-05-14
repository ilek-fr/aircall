require 'minitest/autorun'
require 'aircall'
require 'default_aircall'
require 'default_tests'

module TestAircall
  describe Aircall::Calls do
    def self.call_all
      @call_all ||= DefaultAircall::AIRCALL.calls.get_all()
    end

    def self.call_by_id
      @call_by_id ||= DefaultAircall::AIRCALL.calls.get_by_id(ENV['TEST_DEFAULT_CALL_ID'])
    end

    def self.call_by_user_id
      @call_by_user_id ||= DefaultAircall::AIRCALL.calls.get_by_user_id(ENV['TEST_DEFAULT_USER_ID'])
    end

    def self.call_by_phone_number
      @call_by_phone_number ||= DefaultAircall::AIRCALL.calls.get_by_phone_number(ENV['TEST_DEFAULT_PHONE_NUMBER'])
    end

    DefaultTest::Run.(
        'call_all',
        'call_by_id',
        'call_by_user_id',
        'call_by_phone_number')

    DefaultTest::Params_checker.(
        'calls',
        {
            function: 'get_by_user_id',
            argument: ENV['TEST_DEFAULT_USER_ID']
        },
        {
            function: 'get_by_phone_number',
            argument: ENV['TEST_DEFAULT_PHONE_NUMBER']
        })
  end
end