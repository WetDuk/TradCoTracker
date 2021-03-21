class Point < ApplicationRecord
    belongs_to :user, class_name: "user", foreign_key: "user_id"
    has_many :speaking_events, class_name: "speaking_event", foreign_key: "reference_id"
    has_many :business_events, class_name: "business_event", foreign_key: "reference_id"
end
