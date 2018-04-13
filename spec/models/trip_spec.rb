require 'rails_helper'

describe Trip do 
  describe 'relationships' do
    it 'has many trails' do
      trip = Trip.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)
      expect(trip).to respond_to(:trails)
    end
  end

  describe 'instance_method' do
    it '.total_hikes' do
      trail1 = Trail.create(name: 'Obi Wan', length: 3, address: 'Hello There')

      trail1.trips.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)

      trail1.trips.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)

      expect(trail1.total_hikes).to eq(2)
    end
  end
end