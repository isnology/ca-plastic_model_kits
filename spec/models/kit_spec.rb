require 'rails_helper'

RSpec.describe Kit, type: :model do
  before do
    @kit = Kit.new(name: "fred", brand: "Toyota", scale: "1/4", subject: "Aircraft", price: 20.00)
  end
  
  it 'should have a name' do
    expect(@kit.name).to be_present
    @kit.name = ''
    expect(@kit.name).not_to be_present
  end

  it 'should have a brand' do
    expect(@kit.brand).to be_present
    @kit.brand = ''
    expect(@kit.brand).not_to be_present
  end

  it 'should have a scale' do
    expect(@kit.scale).to be_present
    @kit.scale = ''
    expect(@kit.scale).not_to be_present
  end

  it 'should have a subject' do
    expect(@kit.subject).to be_present
    @kit.subject = ''
    expect(@kit.subject).not_to be_present
  end

  it 'should have a price' do
    expect(@kit.price).to be_valid
    @kit.price = 0
    expect(@kit.price).to be_invalid
  end
end