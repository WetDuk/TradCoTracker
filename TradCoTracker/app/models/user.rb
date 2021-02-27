class User < ApplicationRecord
    has_many :member_points, class_name: "member_point", foreign_key: "reference_id"
end
