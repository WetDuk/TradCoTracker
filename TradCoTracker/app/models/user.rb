class User < ApplicationRecord
  def self.search(search)
    if search
      where(['firstName LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  has_secure_password
end
