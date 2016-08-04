require 'rails_helper'

RSpec.describe Snapshot, type: :model do
  context 'validations' do
    subject { FactoryGirl.build_stubbed :snapshot, attrs }
    let(:attrs) { {} }

    describe 'when seconds is within acceptable range' do
      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    describe 'when seconds is greater than the max countdown value' do
      let(:attrs) { { seconds: Countdown::MAX_VAL + 1 } }
      it 'is invalid' do
        expect(subject).not_to be_valid
      end
    end

    describe 'when seconds is less than the min countdown value' do
      let(:attrs) { { seconds: Countdown::MIN_VAL - 1 } }
      it 'is invalid' do
        expect(subject).not_to be_valid
      end
    end

    describe 'when seconds isn\'t present' do
      let(:attrs) { { seconds: nil } }
      it 'is invalid' do
        expect(subject).not_to be_valid
      end
    end
  end
end
