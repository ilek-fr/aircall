require 'minitest/autorun'
require 'aircall'
require 'default_aircall'
require 'default_tests'

module TestAircall
  describe Aircall::Users do
    def self.user_all
      @user_all ||= DefaultAircall::AIRCALL.users.get_all()
    end

    def self.user_by_id
      @user_by_id ||= DefaultAircall::AIRCALL.users.get_by_id(ENV['TEST_DEFAULT_USER_ID'])
    end

    DefaultTest::Run.(
        'user_all',
        'user_by_id'
    )
  end
end