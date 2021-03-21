class User < ApplicationRecord

    has_secure_password


    def self.search(search)
        if search
            where(["username LIKE ?", "%#{search}%"])
        else
            all
        end
    end
end
