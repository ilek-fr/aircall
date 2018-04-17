require 'minitest/autorun'
require 'aircall'
require 'default_aircall'
require 'default_tests'

module TestAircall
  describe Aircall::Calls do

    def self.call_by_id
      @call_by_id ||= DefaultAircall::AIRCALL.calls.get_by_id(ENV['TEST_DEFAULT_CALL_ID'])
      end
    def self.call_by_user_id
      @call_by_user_id ||= DefaultAircall::AIRCALL.calls.get_by_user_id(ENV['TEST_DEFAULT_USER_ID'])
    end


    describe "By id" do
      it "is Hash" do
        self.class.call_by_id.must_be_instance_of Hash
      end

      it "no error return" do
        self.class.call_by_id['error'].must_be_nil
      end
    end

    describe "by user id" do
      it "is Hash" do
        self.class.call_by_user_id.must_be_instance_of Hash
      end

      it "no error return" do
        self.class.call_by_user_id['error'].must_be_nil
      end
    end
  end
end
