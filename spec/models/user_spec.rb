require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without phone' do
    subject.phone = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without city' do
    subject.city = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without country' do
    subject.country = nil
    expect(subject).to_not be_valid
  end
end
