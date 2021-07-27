require "../lib/docking_station"

describe DockingStation do
  describe "#release_bike" do
    it "releases a working bike" do
      subject.dock_bike(Bike.new)
      bike = subject.release_bike
      expect(bike.working?).to be true
    end
  end

  describe "#dock_bike" do
    it "docks a bike" do
      a_bike = Bike.new
      subject.dock_bike(a_bike)
      expect(subject.bikes).to include(a_bike)
    end

    it 'raises an error when full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike Bike.new }
      expect { subject.dock_bike Bike.new }.to raise_error 'Docking station full'
    end
  end

  describe "raise_error" do
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