# frozen_string_literal: true

class Search < ApplicationRecord
  def search_users
    users = User.all
    users = User.where(['username LIKE ?', "%#{username}%"]) if username.present?
    users = User.where(['email LIKE ?', "%#{email}%"]) if email.present?
    users
  end
end
