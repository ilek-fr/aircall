require 'minitest/autorun'
require 'aircall'
require 'default_aircall'
require 'default_tests'

module TestAircall
  describe Aircall::Contacts do
    def self.contact_by_id
      @contact_by_id ||= DefaultAircall::AIRCALL.contacts.get_by_id(ENV['TEST_DEFAULT_CONTACT_ID'])
    end

    def self.contact_by_phone_number
      @contact_by_phone_number ||= DefaultAircall::AIRCALL.contacts.get_by_phone_number(ENV['TEST_DEFAULT_PHONE_NUMBER'])
    end

    def self.contact_by_email
      @contact_by_email ||= DefaultAircall::AIRCALL.contacts.get_by_email(ENV['TEST_DEFAULT_EMAIL'])
    end

    DefaultTest::Run.(
        'contact_by_id',
        'contact_by_phone_number',
        'contact_by_email')

    DefaultTest::Params_checker.(
        'contacts',
        {
            function: 'get_by_phone_number',
            argument: ENV['TEST_DEFAULT_PHONE_NUMBER']
        },
        {
            function: 'get_by_email',
            argument: ENV['TEST_DEFAULT_EMAIL']
        })
  end
end