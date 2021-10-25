# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :icon

  def icon_thumbnail
    if icon.attached?
      icon.variant(resize: "150x150!").processed
    else
      ""
    end
  end
end
