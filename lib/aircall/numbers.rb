module Aircall
  class Numbers
    include Connection

    def get_by_id(number_id)
      get("/numbers/#{number_id}")
    end

  end
end