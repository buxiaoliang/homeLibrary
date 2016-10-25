class Type < ActiveRecord::Base
  has_many :stuffs
  validates :name, presence: true,
            length: { minimum: 2 }
end
