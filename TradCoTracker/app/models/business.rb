class Business < ApplicationRecord
    belongs_to :point, class_name: "point", foreign_key: "point_id"
end
