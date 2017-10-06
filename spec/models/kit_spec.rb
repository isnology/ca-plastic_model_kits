require 'rails_helper'

RSpec.describe Kit, type: :model do
  before do
    @kit = Kit.new(name: "fred", brand: "Toyota", scale: "1/4", subject: "Aircraft", price: 2000)
  end
  
  it 'should have a name' do
    expect(@kit.name).to be_present
    @kit.name = ''
    expect(@kit).to be_invalid
  end

  it 'should have a brand' do
    expect(@kit.brand).to be_present
    @kit.brand = ''
    expect(@kit).to be_invalid
  end

  it 'should have a scale' do
    expect(@kit.scale).to be_present
    @kit.scale = ''
    expect(@kit).to be_invalid
  end

  it 'should have a subject' do
    expect(@kit.subject).to be_present
    @kit.subject = ''
    expect(@kit).to be_invalid
  end

  it 'should have a positive price' do
    expect(@kit).to be_valid
    @kit.price = -1
    expect(@kit).to be_invalid
  end
end