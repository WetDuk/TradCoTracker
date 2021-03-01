class User < ApplicationRecord
    has_many :points, class_name: "point", foreign_key: "reference_id"
end
