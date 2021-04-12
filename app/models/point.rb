# frozen_string_literal: true

class Point < ApplicationRecord
  def self.to_csv
    attributes = %w[Name Email Event Type Points Date Comments]
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |point|
        # csv << points.attributes.values_at(*attributes)
        curr_user = User.find(point.userID)
        csv << [
          "#{curr_user.firstName} #{curr_user.lastName}",
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
