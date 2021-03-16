class Search < ApplicationRecord
    def search_users
        users = User.all
        users = User.where(["username LIKE ?", "%#{username}%"]) if username.present?
        users = User.where(["email LIKE ?", "%#{email}%"])    if email.present?
        # users = Users.where(["points BETWEEN ? and ?", "%#{min_points}%", "%#{max_points}%"]) if max_points.present? && min_points.present?
        return users
    end
        # users = Users.where(["points LIKE ?", "%#{max_points}%"]) if username.present?
end
