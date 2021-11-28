require 'rails_helper'

RSpec.describe Communicator, type: :model do
  subject { build(:communicator) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without status' do
    subject.phone = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without occurrence' do
    subject.occurrence = nil
    expect(subject).to_not be_valid
  end
end
