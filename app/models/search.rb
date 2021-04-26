# frozen_string_literal: true

class Search < ApplicationRecord
  def search_users
    users = User.all
    users = User.where(['firstName LIKE ?', "%#{username}%"]) if username.present?
    users = User.where(['email LIKE ?', "%#{email}%"]) if email.present?
    array = []
    if min_points.present? || max_points.present?
      puts 'min_points or max_points is present'
      users.each do |user|
        business_sum = Point.where(eventType: 'Business', userID: user.id).sum(:pointAmount)
        speaking_sum = Point.where(eventType: 'Speaking', userID: user.id).sum(:pointAmount)
        total = business_sum + speaking_sum
        next unless total >= min_points && max_points >= total

        puts user.firstName
        dict = { 'firstName' => user.firstName, 'lastName' => user.lastName,
                 'business' => business_sum, 'speaking' => speaking_sum }
        array << dict
      end
    else
      puts 'not min_points or max_points is present'
      users.each do |user|
        business_sum = Point.where(eventType: 'Business', userID: user.id).sum(:pointAmount)
        speaking_sum = Point.where(eventType: 'Speaking', userID: user.id).sum(:pointAmount)
        dict = { 'firstName' => user.firstName, 'email' => user.email, 'lastName' => user.lastName,
                 'business' => business_sum, 'speaking' => speaking_sum }
        array << dict
      end
    end
    array
  end
end
