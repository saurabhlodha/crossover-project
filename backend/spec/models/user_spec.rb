require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    FactoryGirl.build(:user)
  end

  it 'responds to attributes' do
    expect(user).to respond_to(:email)
    expect(user).to respond_to(:password)
    expect(user).to respond_to(:password_confirmation)
    expect(user).to respond_to(:auth_token)
    expect(user).to respond_to(:access_level)
  end

  it 'auth token generated should not be empty' do
    user.generate_auth_token
    expect(user.auth_token).not_to be_empty
  end

  it { expect(user).to be_valid }
  it { should have_many(:trips) }
  it { should validate_uniqueness_of(:auth_token) }

end
