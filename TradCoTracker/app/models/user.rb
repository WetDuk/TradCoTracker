class User < ApplicationRecord
  include Clearance::User

    def self.search(search)
        if search
            where(["username LIKE ?", "%#{search}%"])
        else
            all
        end
    end
end
