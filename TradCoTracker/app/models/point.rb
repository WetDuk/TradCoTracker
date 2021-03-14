# frozen_string_literal: true

class Point < ApplicationRecord
<<<<<<< Updated upstream
=======
    belongs_to :user, class_name: "user", foreign_key: "user_id"
    has_many :speaking_events, class_name: "speaking_event", foreign_key: "reference_id"
    has_many :business_events, class_name: "business_event", foreign_key: "reference_id"
>>>>>>> Stashed changes
end
