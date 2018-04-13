require 'rails_helper'

describe Trail do 
  describe 'relationships' do
    it 'has many trips' do
      trail = Trail.create(length: 20, name: 'Anakin', address: 'Sandy Station')
      expect(trail).to respond_to(:trips)
    end
  end
end