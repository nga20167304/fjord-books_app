# frozen_string_literal: true

class FollowRelationship < ApplicationRecord
  belongs_to :follower, class_name: 'User', unique: true
  belongs_to :following, class_name: 'User', unique: true
end
