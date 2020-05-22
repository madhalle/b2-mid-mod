class Actor < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age

  has_many :movies

  def self.average_age
    average(:age)
  end
end
