module Aircall
  class Users
    include Connection

    def get_all(page: 1, per_page: 5, order: "asc", order_by: "created_at", from: nil, to: nil)
      get(construct_request_with_arguments("/users", binding))
    end

    def get_by_id(user_id)
      get("/users/#{user_id}")
    end

  end
end