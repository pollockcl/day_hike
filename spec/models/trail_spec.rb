require 'rails_helper'

describe Trail do 
  describe 'relationships' do
    it 'has many trips' do
      trail = Trail.create(length: 20, name: 'Anakin', address: 'Sandy Station')
      expect(trail).to respond_to(:trips)
    end
  end

  describe 'instance methods' do
    it '.planned_total_hiking_distance' do
      trip1 = Trip.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)
      trail1 = trip1.trails.create(name: 'Obi Wan', length: 2, address: 'Hello There')
      trail2 = trip1.trails.create(name: 'Grevious', length: 20, address: 'A Bold One')
      trail3 = trip1.trails.create(name: 'Vader', length: 25, address: 'Disturbing Faith')

      expect(trip1.planned_total_hiking_distance).to eq(47)
     end

    it '.average_hiking_distance' do
      trip1 = Trip.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)
      trail1 = trip1.trails.create(name: 'Obi Wan', length: 3, address: 'Hello There')
      trail2 = trip1.trails.create(name: 'Grevious', length: 20, address: 'A Bold One')
      trail3 = trip1.trails.create(name: 'Vader', length: 25, address: 'Disturbing Faith')

      expect(trip1.average_hiking_distance).to eq(16)
    end

    it '.longest_hiking_distance' do
      trip1 = Trip.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)
      trail1 = trip1.trails.create(name: 'Obi Wan', length: 3, address: 'Hello There')
      trail2 = trip1.trails.create(name: 'Grevious', length: 20, address: 'A Bold One')
      trail3 = trip1.trails.create(name: 'Vader', length: 25, address: 'Disturbing Faith')

      expect(trip1.longest_hiking_distance).to eq(25)
    end

    it '.shortest_hiking_distance' do
      trip1 = Trip.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)
      trail1 = trip1.trails.create(name: 'Obi Wan', length: 3, address: 'Hello There')
      trail2 = trip1.trails.create(name: 'Grevious', length: 20, address: 'A Bold One')
      trail3 = trip1.trails.create(name: 'Vader', length: 25, address: 'Disturbing Faith')

      expect(trip1.shortest_hiking_distance).to eq(3)
    end
  end
end