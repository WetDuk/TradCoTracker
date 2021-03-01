class User < ApplicationRecord
    has_one :point, class_name: "point", foreign_key: "point_id"
end
