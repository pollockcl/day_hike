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

    scenario 'see trail hikes ' do
      trail = Trail.create(name: 'Anakin', address: 'Hates Sand', length: 20)
      hike1 = trail.trips.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)
      hike2 = trail.trips.create(name: 'Obi Wan', start_date: Time.now + 300000, end_date: Time.now + 300000)
      hike3 = trail.trips.create(name: 'General Grievious', start_date: Time.now + 900000, end_date: Time.now + 900000)

      visit trail_path(trail)


      expect(page).to have_content(trail.total_hikes)
    end
  end
end

