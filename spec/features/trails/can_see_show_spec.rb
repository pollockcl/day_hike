require 'rails_helper'

context 'as a visitor' do
  context 'visit show' do
    scenario 'see trail info ' do
      trail = Trail.create(name: 'Anakin', address: 'Hates Sand', length: 20)

      visit trail_path(trail)

      expect(page).to have_content(trail.name)
      expect(page).to have_content(trail.address)
      expect(page).to have_content(trail.length)
    end
  end
end

