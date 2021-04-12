# frozen_string_literal: true

class User < ApplicationRecord
  def self.search(search) 
    if search
      where(["email LIKE ?","%#{search}%"])
    else
      all
    end
  end
  has_secure_password
end
