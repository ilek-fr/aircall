module Aircall
  class Calls
    include Connection

    def all
      get('/calls')
    end

    def search
      get('/calls/search')
    end

    def get_by_id(call_id)
      get("/calls/#{call_id}")
    end

=begin
    def get_by_from(from)
      get("/calls/search?order_by=#{from}")
    end
=end

    
  end
end