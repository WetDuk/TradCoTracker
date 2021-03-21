# frozen_string_literal: true

class User < ApplicationRecord

  has_secure_password
  validates :email, presence:true, uniqueness: true
  validates :username, presence:true, uniqueness: true


  def self.search(search)
    if search
      where(['username LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
