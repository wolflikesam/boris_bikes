require "../lib/docking_station"

describe DockingStation do
  describe "#release_bike" do
    it "releases a working bike" do
      bike = subject.release_bike
      expect(bike.working?).to be true
    end
  end

  describe "#dock_bike" do
    it "docks a bike" do
      a_bike = Bike.new
      subject.dock_bike(a_bike)
      expect(subject.bike).to eql(a_bike)
    end
  end

  describe "#raise_error" do

    it { expect { subject.release_bike }.to raise_error 'No bikes available'}
  end

  describe '#release_bike' do
    it 'releases the same docked bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end
  end

end