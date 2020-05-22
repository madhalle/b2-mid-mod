class Movie < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :creation_year
  validates_presence_of :genre

  has_many :actors
  belongs_to :studio
end
