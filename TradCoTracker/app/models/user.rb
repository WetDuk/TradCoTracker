# frozen_string_literal: true

class User < ApplicationRecord
  def self.search(search)
    if search
      where(['username LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
