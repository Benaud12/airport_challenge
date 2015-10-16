require 'weather'

describe Weather do

  let(:dummy_class){ class Class; include Weather; end }

  it 'is not stormy when rand(20) greater than 2' do
    allow(Random).to receive(:rand).with(20){3}
    expect(dummy_class).not_to be_stormy
  end

  it 'is stormy when rand(20) less than 3' do
    allow(Random).to receive(:rand).with(20){2}
    expect(dummy_class).to be_stormy
  end

end