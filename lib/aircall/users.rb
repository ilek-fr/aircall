module Aircall
  class Users
    include Connection

    def get_by_id(user_id)
      get("/users/#{user_id}")
    end

  end
end