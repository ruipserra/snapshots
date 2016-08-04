require 'rails_helper'

RSpec.feature "Snapshots", type: :feature do

  context 'viewing existing snapshot records' do
    before do
      FactoryGirl.create(:snapshot, seconds: 2)
      FactoryGirl.create(:snapshot, seconds: 4)
      FactoryGirl.create(:snapshot, seconds: 6)
      visit '/'
    end

    it 'they are visible in the order they were inserted' do
      expect(find('table > tbody > tr:nth-child(1)')).to have_text '2'
      expect(find('table > tbody > tr:nth-child(2)')).to have_text '4'
      expect(find('table > tbody > tr:nth-child(3)')).to have_text '6'
    end
  end

end
