# frozen_string_literal: true

class Item < ApplicationRecord
  STATUSES = { 0 => '買ってない', 1 => '買った', 2 => 'レビュー済' }.freeze

  validates :name, :description, :status, :priority, presence: true
  validates :name, uniqueness: true

  enum status: { unpurchased: 0, purchased: 1, reviewed: 2 } do
    event :purchase do
      transition unpurchased: :purchased
    end

    event :review do
      transition purchased: :reviewed
    end
  end
end
