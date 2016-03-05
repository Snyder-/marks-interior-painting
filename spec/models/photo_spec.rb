require 'rails_helper'
require 'stringio'

RSpec.describe Photo, type: :model do
  before :each do
    allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(true)
  end
  it 'has a valid factory' do
    expect(FactoryGirl.create(:photo)).to be_valid
  end
  it 'is invalid without a title' do
    expect(FactoryGirl.build(:photo, title: nil)).to be_invalid
  end
  it 'is invalid without a description' do
    expect(FactoryGirl.build(:photo, description: nil)).to be_invalid 
  end
  it 'is invalid without an image' do
    expect(FactoryGirl.build(:photo, image: nil)).to be_invalid
  end
  it 'must have a unique title' do
    FactoryGirl.create(:photo, title: 'hello')
    expect(FactoryGirl.build(:photo, title: 'hello')).to be_invalid
  end
end
