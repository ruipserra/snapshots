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

  context 'recording new snapshots', :js do
    let(:add_btn) { find('.js-add-button') }

    before do
      visit '/'
      record_ajax_requests
    end

    specify 'clicking the "Add" updates the table' do
      table = find('.js-snapshots-table')

      # At first the table is empty
      expect { table.find('tbody > tr') }.to raise_error Capybara::ElementNotFound

      add_btn.click
      wait_for_ajax

      # Table now has one row
      expect(table.find('tbody > tr')).to be_present

      visit '/'

      # Snapshot was persisted in the database
      expect(table.find('tbody > tr')).to be_present
    end
  end

end
