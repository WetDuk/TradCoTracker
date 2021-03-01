class BusinessEvent < ApplicationRecord

    belongs_to :member_points, class_name: "member_points", foreign_key: "member_points_id"

end
