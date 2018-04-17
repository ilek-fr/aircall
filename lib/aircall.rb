require "aircall/version"
require 'aircall/connection'
require 'aircall/calls'
require 'aircall/contacts'
require 'aircall/users'
require 'aircall/numbers'

module Aircall

  def self.new(*a)
    Aircall.new(*a)
  end

  class Aircall
    attr_accessor :id, :token

    def initialize(args = {})
      @id = args[:id]
      @token = args[:token]
    end


    def calls
      @calls ||= Calls.new self
    end

    def contacts
      @contacts ||= Contacts.new self
    end

    def users
      @users ||= Users.new self
    end

    def numbers
      @numbers ||= Numbers.new self
    end
  end

end