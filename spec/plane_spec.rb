require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying"
# and landed?
# Are you testing that?

describe Plane do

  let(:airport){double(:airport, {name: 'Heathrow'})}

  xit 'is flying when created'

  it 'can land at given airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'is landed after landing' do
    subject.land(airport)
    expect(subject).to be_landed
  end

  it 'is located at given airport after landing' do
    subject.land(airport)
    expect(subject.location).to eq airport.name
  end

  xit 'can take off'

  xit 'is flying after take off'

end
