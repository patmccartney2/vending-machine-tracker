require 'rails_helper'

describe 'user can visit snack show page' do
  describe 'user sees snack data' do
    it 'should display the name and price' do
      owner = Owner.create(name: "Rick Sanchez")
      machine = owner.machines.create(location: "Rick's Garage")
      snack = machine.snacks.create(name: "Flurbos", price: 12.00)
      snack_2 = machine.snacks.create(name: "Blips", price: 18.00)
      snack_3 = machine.snacks.create(name: "Chitz", price: 30.00)

      visit snack_path(snack)

      expect(page).to have_content(snack.name)
      expect(page).to have_content(snack.price)
    end
    it 'should display other locations containing that snack and their data' do
      owner = Owner.create(name: "Morty")
      machine_1 = owner.machines.create(location: "School")
      snack_1 = machine_1.snacks.create(name: "Glip Glops", price: 12.00)
      snack_2 = machine_1.snacks.create(name: "Flurbos", price: 18.00)
      snack_3 = machine_1.snacks.create(name: "Whosits", price: 30.00)
      owner_2 = Owner.create(name: "Rick Sanchez")
      machine_2 = owner.machines.create(location: "Rick's Garage")
      snack_4 = machine_2.snacks.create(name: "Flurbos", price: 10.00)
      snack_5 = machine_2.snacks.create(name: "Blips", price: 10.00)
      snack_6 = machine_2.snacks.create(name: "Chitz", price: 10.00)

      visit snack_path(snack_4)

      expect(page).to have_content(machine_1.location)
      expect(page).to have_content(machine_1.average_price)
      expect(page).to have_content(machine_2.location)
      expect(page).to have_content(machine_2.average_price)
    end
  end
end
