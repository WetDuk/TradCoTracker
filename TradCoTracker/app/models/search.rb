# frozen_string_literal: true

class Search < ApplicationRecord
  def search_users
    users = User.all
    users = User.where(['firstName LIKE ?', "%#{firstName}%"]) if firstName.present?
    users = User.where(['lastName Like ?', "%#{lastName}%"]) if lastName.present?
    users = User.where(['email LIKE ?', "%#{email}%"]) if email.present?
    return users
  end
end
