# frozen_string_literal: true

class Point < ApplicationRecord

    def self.to_csv
        attributes = %w{Name Event Type Points Date Comments}
        CSV.generate(headers: true) do |csv|
            csv << attributes

            all.each do |point|
                # csv << points.attributes.values_at(*attributes)
                currUser = User.find(point.userID)
                csv << [
                    currUser.email,
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
