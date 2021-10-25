# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :icon

  def icon_thumbnail
    if icon.attached?
      icon.variant(resize_to_fit: [150,150]).processed
    end
  end
end
