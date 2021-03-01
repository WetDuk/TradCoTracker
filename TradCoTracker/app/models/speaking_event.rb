class SpeakingEvent < ApplicationRecord
<<<<<<< Updated upstream

    belongs_to :member_point, class_name: "member_point", foreign_key: "member_point_id"

=======
    belongs_to :point, class_name: "point", foreign_key: "point_id"
>>>>>>> Stashed changes
end
