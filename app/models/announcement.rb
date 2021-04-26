# frozen_string_literal: true

class Announcement < ApplicationRecord
  validates_presence_of :header
  validates_presence_of :content
  validates_presence_of :announceDate
end
