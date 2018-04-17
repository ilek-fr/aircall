module Aircall
  class Users
    include Connection

    def get_by_id(call_id)
      get("/users/#{call_id}")
    end

  end
end