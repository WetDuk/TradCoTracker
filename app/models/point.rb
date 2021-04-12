# frozen_string_literal: true

class Point < ApplicationRecord
  belongs_to :user, class_name: 'user', foreign_key: 'user_id'
  def self.to_csv
    attributes = %w[Name Event Type Points Date Comments]
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |point|
        # csv << points.attributes.values_at(*attributes)
        curr_user = User.find(point.userID)
        csv << [
          curr_user.email,
          point.eventName,
          point.eventType,
          point.pointAmount,
          point.submissionDate,
          point.comments
        ]
      end
    end
  end
end
