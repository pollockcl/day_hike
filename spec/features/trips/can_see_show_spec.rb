require 'rails_helper'

context 'as a visitor' do
  context 'visit show' do
    scenario 'see trip info with trails' do
      trip1 = Trip.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)
      trail1 = trip1.trails.create(name: 'Obi Wan', length: 29, address: 'Hello There')
      trail2 = trip1.trails.create(name: 'Grevious', length: 29, address: 'A Bold One')
      trail3 = trip1.trails.create(name: 'Vader', length: 29, address: 'Disturbing Faith')

      visit trips_path

      click_on trip1.name

      expect(current_path).to eq(trip_path(trip1))
      expect(page).to have_content(trail1.name)
      expect(page).to have_content(trail1.length)
      expect(page).to have_content(trail1.address)
      expect(page).to have_content(trail2.name)
      expect(page).to have_content(trail2.length)
      expect(page).to have_content(trail2.address)
      expect(page).to have_content(trail3.name)
      expect(page).to have_content(trail3.length)
      expect(page).to have_content(trail3.address)
    end

    scenario 'see planned total hiking distance' do
      trip1 = Trip.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)
      trail1 = trip1.trails.create(name: 'Obi Wan', length: 29, address: 'Hello There')
      trail2 = trip1.trails.create(name: 'Grevious', length: 29, address: 'A Bold One')
      trail3 = trip1.trails.create(name: 'Vader', length: 29, address: 'Disturbing Faith')

      visit trip_path(trip1)

      expect(page).to have_content(trip1.planned_total_hiking_distance)
    end

    scenario 'see average hiking distance' do 
      trip1 = Trip.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)
      trail1 = trip1.trails.create(name: 'Obi Wan', length: 29, address: 'Hello There')
      trail2 = trip1.trails.create(name: 'Grevious', length: 29, address: 'A Bold One')
      trail3 = trip1.trails.create(name: 'Vader', length: 29, address: 'Disturbing Faith')

      visit trip_path(trip1)

      expect(page).to have_content(trip1.average_hiking_distance)
    end

    scenario 'see longest and shortest hiking distance' do 
      trip1 = Trip.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)
      trail1 = trip1.trails.create(name: 'Obi Wan', length: 21, address: 'Hello There')
      trail2 = trip1.trails.create(name: 'Grevious', length: 29, address: 'A Bold One')
      trail3 = trip1.trails.create(name: 'Vader', length: 29, address: 'Disturbing Faith')

      visit trip_path(trip1)

      expect(page).to have_content(trip1.shortest_hiking_distance)
      expect(page).to have_content(trip1.longest_hiking_distance)
    end
  end
end
