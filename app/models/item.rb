# frozen_string_literal: true

class Item < ApplicationRecord
  validates :name, :description, :status, :priority, presence: true
  validates :name, uniqueness: true
end
