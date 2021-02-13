class BusinessEvent < ApplicationRecord

    belongs_to :member_point, class_name: "member_point", foreign_key: "member_point_id"

end
