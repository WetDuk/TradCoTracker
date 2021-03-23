# frozen_string_literal: true

class Search < ApplicationRecord
  def search_users
    users = User.all
    users = User.where(['firstname LIKE ?', "%#{firstname}%"]) if firstName.present?
    users = User.where(['lastname Like ?', "%#{lastname}%"]) if lastname.present?
    users = User.where(['email LIKE ?', "%#{email}%"]) if email.present?
    users
  end
end
