# frozen_string_literal: true

class User < ApplicationRecord
  def self.search(search) 
    if search
      where(["email LIKE ?","%#{search}%"])
    else
      all
    end
  end
  validates_uniqueness_of :email
  has_secure_password
  def self.to_csv
    attributes = %w[Name Email Officer Speaking Business]
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        # csv << points.attributes.values_at(*attributes)
        business_sum = Point.where(eventType: 'Business', userID: user.id).sum(:pointAmount)
        speaking_sum = Point.where(eventType: 'Speaking', userID: user.id).sum(:pointAmount)
        csv << [
          "#{user.firstName} #{user.lastName}",
          user.email,
          user.isOfficer,
          business_sum,
          speaking_sum
        ]
      end
    end
  end
end
