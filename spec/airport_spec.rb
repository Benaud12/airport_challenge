require 'airport'

describe Airport do

  let(:airport){ described_class.new }
  let(:plane){ double(:plane, land: nil, take_off: nil) }

  it 'has a default capacity' do
    expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  describe 'planes landing (in good weather)' do

    before(:each) do
      allow(airport.weather).to receive(:stormy?) {false}
    end

    it 'allows landing' do
      expect(airport).to be_allow_landing
    end

    it 'calls the planes land method' do
      expect(plane).to receive :land
      airport.receive_plane(plane)
    end

    it 'receives a plane' do
      airport.receive_plane(plane)
      expect(airport.hangar).to include plane
    end

  end


  describe 'planes taking off (in good weather)' do

    before(:each) do
      allow(airport.weather).to receive(:stormy?) {false}
    end

    it 'allows take off' do
      expect(airport).to be_allow_take_off
    end

    it 'releases specific plane' do
      plane1 = (double :plane1, land: nil)
      plane2 = (double :plane2, land: nil, take_off: nil)
      plane3 = (double :plane3, land: nil)
      airport.receive_plane (plane1)
      airport.receive_plane (plane2)
      airport.receive_plane (plane3)
      expect(airport.release_plane(plane2)).to eq plane2
    end

    it 'calls the planes take_off method' do
      airport.receive_plane(plane)
      expect(plane).to receive :take_off
      airport.release_plane(plane)
    end

  end


  describe 'traffic control' do

    context 'when airport is full in good weather' do

      before(:each) do
        allow(airport.weather).to receive(:stormy?) {false}
        airport.capacity.times {airport.receive_plane(plane)}
      end

      it 'does not allow landing' do
        expect(airport).not_to be_allow_landing
      end

      it 'does allow take off' do
        expect(airport).to be_allow_take_off
      end

      it 'does not receive plane' do
        plane_count = airport.hangar.count
        airport.receive_plane(plane)
        expect(airport.hangar.count).to eq plane_count
      end

      it 'does not call the planes land method' do
        expect(plane).not_to receive :land
        airport.receive_plane(plane)
      end

      it 'following take off, allows another plane to land' do
        airport.release_plane(plane)
        expect(airport).to be_allow_landing
      end

    end


    context 'stormy weather' do

      before(:each) do
        allow(airport.weather).to receive(:stormy?) {true}
      end

      it 'checks weather before allowing landing' do
        expect(airport.weather).to receive :stormy?
        airport.allow_landing?
      end

      it 'doesn\'t allow landing' do
        expect(airport).not_to be_allow_landing
      end

      it 'doesn\'t receive planes' do
        airport.receive_plane(plane)
        expect(airport.hangar).not_to include plane
      end

      it 'doesn\'t allow taking off' do
        expect(airport).not_to be_allow_take_off
      end

      it 'doesn\'t release planes' do
        allow(airport.weather).to receive(:stormy?) {false}
        airport.receive_plane(plane)
        allow(airport.weather).to receive(:stormy?) {true}
        airport.release_plane(plane)
        expect(airport.hangar).to include plane
      end

    end

  end

end
