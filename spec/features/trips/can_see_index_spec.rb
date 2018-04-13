require 'rails_helper'

context 'as a visitor' do
  context 'visit index' do
    scenario 'see link to a trip show page' do
      trip1 = Trip.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)
      trip2 = Trip.create(name: 'Obi Wan', start_date: Time.now + 300000, end_date: Time.now + 300000)
      trip3 = Trip.create(name: 'General Grievious', start_date: Time.now + 900000, end_date: Time.now + 900000)

      visit trips_path

      expect(page).to have_link('Anakin')
      expect(page).to have_link('Obi Wan')
      expect(page).to have_link('General Grievious')
    end

    scenario 'see name, start_date and end_date of all trails' do
      trip1 = Trip.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)
      trip2 = Trip.create(name: 'Obi Wan', start_date: Time.now + 300000, end_date: Time.now + 300000)
      trip3 = Trip.create(name: 'General Grievious', start_date: Time.now + 900000, end_date: Time.now + 900000)
      
      visit trips_path

      expect(page).to have_content(trip1.name)
      expect(page).to have_content(trip1.start_date)
      expect(page).to have_content(trip1.end_date)
      expect(page).to have_content(trip2.name)
      expect(page).to have_content(trip2.start_date)
      expect(page).to have_content(trip2.end_date)
      expect(page).to have_content(trip3.name)
      expect(page).to have_content(trip3.start_date)
      expect(page).to have_content(trip3.end_date)
    end
  end
end
