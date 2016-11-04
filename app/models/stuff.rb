class Stuff < ActiveRecord::Base
  belongs_to :location
  belongs_to :type
  validates :name, presence: true,
            length: { minimum: 2 }
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
    where("description LIKE ?", "%#{search}%")
  end
end
