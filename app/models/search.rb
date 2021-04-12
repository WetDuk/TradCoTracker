# frozen_string_literal: true

class Search < ApplicationRecord
  def search_users
    users = User.all
    users = User.where(['firstname LIKE ?', "%#{firstName}%"]) if firstName.present?
    users = User.where(['lastname Like ?', "%#{lastName}%"]) if lastName.present?
    users = User.where(['email LIKE ?', "%#{email}%"]) if email.present?
  end

  def search_points
  end

  def search_events
  end

  def 
  
end
