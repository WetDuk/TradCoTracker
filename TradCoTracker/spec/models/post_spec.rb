# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it "does not render the wrong template" do
    get "/posts/new"
    expect(response).to_not render_template(:show)
end
end

