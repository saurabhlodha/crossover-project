require 'rails_helper'

RSpec.describe Trip, type: :model do
  let(:trip) do
    FactoryGirl.build(:trip)
  end

  it 'responds to attributes' do
    expect(trip).to respond_to(:destination)
    expect(trip).to respond_to(:comment)
    expect(trip).to respond_to(:start_date)
    expect(trip).to respond_to(:end_date)
    expect(trip).to respond_to(:user)
  end

  it { expect(trip).to be_valid }
  it { expect(trip).to belong_to(:user) }
  it { expect(trip).to validate_presence_of :user }

  it 'returns a sorted array of results that match' do
    manali = FactoryGirl.create(:manali)
    bali = FactoryGirl.create(:bali)
    china = FactoryGirl.create(:china)
  	chile = FactoryGirl.create(:chile)
    expect(Trip.starts_after('2012-01-01').ends_before('2014-01-01')).to eq([manali, bali])
    expect(Trip.destination('ali')).to eq([bali, manali])
    expect(Trip.comment('country')).to eq([bali, china])
  end
end
