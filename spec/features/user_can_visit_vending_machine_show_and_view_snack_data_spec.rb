require 'rails_helper'

describe 'user visits snack show page' do
  describe 'user can view information for the machine' do
    it 'should display the name of its snacks and their prices' do
      owner = Owner.create(name: "Rick Sanchez")
      machine = owner.machines.create(location: "Rick's Garage")
      snack = machine.snacks.create(name: "Flurbos", price: 12.12)

      visit machine_path(machine)

      expect(page).to have_content("Rick's Garage")
      expect(page).to have_content(12.12)
    end
  end
  describe 'user can view average price of all snacks in machine' do
    it 'should display a propper calculation of the average price for snacks' do
      owner = Owner.create(name: "Rick Sanchez")
      machine = owner.machines.create(location: "Rick's Garage")
      snack = machine.snacks.create(name: "Flurbos", price: 12.00)
      snack_2 = machine.snacks.create(name: "Blips", price: 18.00)
      snack_3 = machine.snacks.create(name: "Chitz", price: 30.00)

      visit machine_path(machine)

      expect(page).to have_content("verage Price for this Machine: 20.0")
    end
  end
end
