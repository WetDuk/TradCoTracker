class Point < ApplicationRecord
    belongs_to :user, class_name: "user", foreign_key: "user_id"
    has_one  speaking, class_name:  speaking", foreign_key:  speaking_id"
    has_one  business, class_name:  business", foreign_key:  business_id"

end
