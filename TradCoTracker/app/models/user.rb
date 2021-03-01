class User < ApplicationRecord
    has_many :member_points, class_name: "member_points", foreign_key: "reference_id"
end
