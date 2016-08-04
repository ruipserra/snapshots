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

    specify 'clicking the "Add" button creates a new snapshot in the database' do
      expect do
        add_btn.click
        wait_for_ajax
      end.to change(Snapshot, :count).by 1
    end

    specify 'clicking the "Add" updates the table' do
      table = find('.js-snapshots-table')
      expect do
        add_btn.click
        wait_for_ajax
      end.to change { table.find('tbody > tr').size }.by 1
    end
  end

end
