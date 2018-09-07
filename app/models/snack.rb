class Snack < ApplicationRecord
  validates_presence_of :name, :price
  belongs_to :machine

  def find_machines
    machines.find(:snack)
  end

  def find_locations
    machines.find(:snack).location
  end

end
