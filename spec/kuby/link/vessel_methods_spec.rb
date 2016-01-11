require 'spec_helper'

class DummyClass
end

describe Kuby::Link::VesselMethods do
  subject { DummyClass.new }

  before do
    subject.extend Kuby::Link::VesselMethods
    allow(subject).to receive(:api_get)
  end

  describe '#altitude' do
    it 'implements the v.altitude call' do
      expect(subject).to receive(:api_get).with('v.altitude')

      subject.altitude
    end

    it 'returns a float' do
      expect(subject.altitude).to be_an_instance_of Float
    end
  end

  describe '#height' do
    it 'implements the v.heightFromTerrain call' do
      expect(subject).to receive(:api_get).with('v.heightFromTerrain')

      subject.height
    end

    it 'returns a float' do
      expect(subject.height).to be_an_instance_of Float
    end
  end

  describe '#terrain_height' do
    it 'implements the v.terrainHeight call' do
      expect(subject).to receive(:api_get).with('v.terrainHeight')

      subject.terrain_height
    end

    it 'returns a float' do
      expect(subject.terrain_height).to be_an_instance_of Float
    end
  end

  describe '#mission_time' do
    it 'implements the v.missionTime call' do
      expect(subject).to receive(:api_get).with('v.missionTime')

      subject.mission_time
    end

    it 'returns a float' do
      expect(subject.mission_time).to be_an_instance_of Float
    end
  end

  describe '#surface_velocity' do
    it 'implements the v.surfaceVelocity call' do
      expect(subject).to receive(:api_get).with('v.surfaceVelocity')

      subject.surface_velocity
    end

    it 'returns a float' do
      expect(subject.surface_velocity).to be_an_instance_of Float
    end
  end

  describe '#surface_velocity_x' do
    it 'implements the v.surfaceVelocityx call' do
      expect(subject).to receive(:api_get).with('v.surfaceVelocityx')

      subject.surface_velocity_x
    end

    it 'returns a float' do
      expect(subject.surface_velocity_x).to be_an_instance_of Float
    end
  end

  describe '#surface_velocity_y' do
    it 'implements the v.surfaceVelocityy call' do
      expect(subject).to receive(:api_get).with('v.surfaceVelocityy')

      subject.surface_velocity_y
    end

    it 'returns a float' do
      expect(subject.surface_velocity_y).to be_an_instance_of Float
    end
  end

  describe '#surface_velocity_z' do
    it 'implements the v.surfaceVelocityz call' do
      expect(subject).to receive(:api_get).with('v.surfaceVelocityz')

      subject.surface_velocity_z
    end

    it 'returns a float' do
      expect(subject.surface_velocity_z).to be_an_instance_of Float
    end
  end

  describe '#angular_velocity' do
    it 'implements the v.angularVelocity call' do
      expect(subject).to receive(:api_get).with('v.angularVelocity')

      subject.angular_velocity
    end

    it 'returns a float' do
      expect(subject.angular_velocity).to be_an_instance_of Float
    end
  end

  describe '#orbital_velocity' do
    it 'implements the v.orbitalVelocity call' do
      expect(subject).to receive(:api_get).with('v.orbitalVelocity')

      subject.orbital_velocity
    end

    it 'returns a float' do
      expect(subject.orbital_velocity).to be_an_instance_of Float
    end
  end

  describe '#surface_speed' do
    it 'implements the v.surfaceSpeed call' do
      expect(subject).to receive(:api_get).with('v.surfaceSpeed')

      subject.surface_speed
    end

    it 'returns a float' do
      expect(subject.surface_speed).to be_an_instance_of Float
    end
  end

  describe '#vertical_speed' do
    it 'implements the v.verticalSpeed call' do
      expect(subject).to receive(:api_get).with('v.verticalSpeed')

      subject.vertical_speed
    end

    it 'returns a float' do
      expect(subject.vertical_speed).to be_an_instance_of Float
    end
  end

  describe '#atmospheric_density' do
    it 'implements the v.atmosphericDensity call' do
      expect(subject).to receive(:api_get).with('v.atmosphericDensity')

      subject.atmospheric_density
    end

    it 'returns a float' do
      expect(subject.atmospheric_density).to be_an_instance_of Float
    end
  end

  describe '#lat' do
    it 'implements the v.lat call' do
      expect(subject).to receive(:api_get).with('v.lat')

      subject.lat
    end
  end

  describe '#long' do
    it 'implements the v.long call' do
      expect(subject).to receive(:api_get).with('v.long')

      subject.long
    end
  end

  describe '#dynamic_pressure' do
    it 'implements the v.dynamicPressure call' do
      expect(subject).to receive(:api_get).with('v.dynamicPressure')

      subject.dynamic_pressure
    end

    it 'returns a float' do
      expect(subject.dynamic_pressure).to be_an_instance_of Float
    end
  end

  describe '#name' do
    it 'implements the v.name call' do
      expect(subject).to receive(:api_get).with('v.name')

      subject.name
    end
  end
end
