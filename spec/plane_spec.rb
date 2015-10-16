require 'plane'

describe Plane do

  let(:plane){ described_class.new }

  it 'flying when created' do
    expect(plane).to be_flying
  end

  describe 'landing' do

    it 'can land' do
      expect(plane).to respond_to(:land)
    end

    it 'is not flying after landing' do
      plane.land
      expect(plane).not_to be_flying
    end

    it 'raises error when already landed' do
      plane.land
      expect{plane.land}.to raise_error "Already landed"
    end

  end

  describe 'taking off' do

    it 'can take off' do
      plane.land
      expect(plane).to respond_to(:take_off)
    end

    it 'is flying after take off' do
      plane.land
      plane.take_off
      expect(plane).to be_flying
    end

    it 'raises error when already flying' do
      expect{plane.take_off}.to raise_error "Already flying"
    end

  end

end
