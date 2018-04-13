require 'rails_helper'

describe Trip do 
  describe 'relationships' do
    it 'has many trails' do
      trip = Trip.create(name: 'Anakin', start_date: Time.now, end_date: Time.now)
      expect(trip).to respond_to(:trails)
    end
  end
end