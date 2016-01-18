require 'spec_helper'

class DummyClass
end

describe Kuby::Link::FlightMethods do
  subject { DummyClass.new }

  before do
    subject.extend Kuby::Link::FlightMethods
    allow(subject).to receive(:api_get)
  end

  describe '#abort' do
    it 'implements the f.abort call' do
      expect(subject).to receive(:api_get).with('f.abort')

      subject.abort
    end
  end

  (1..10).each do |group_no|
    describe "#actiongroup_#{group_no}" do
      it "implements the f.ag#{group_no} call" do
        expect(subject).to receive(:api_get).with("f.ag#{group_no}")

        subject.send("actiongroup_#{group_no}")
      end
    end
  end

  describe '#brake' do
    it 'implements the f.brake call' do
      expect(subject).to receive(:api_get).with('f.brake')

      subject.brake
    end
  end

  describe '#pitch' do
    it 'implements the v.setPitch call' do
      expect(subject).to receive(:api_set).with('v.setPitch', 0.25)

      subject.pitch = 45.0
    end

    context 'throttle is larger than 1' do
      it 'normalizes to 1.0' do
        expect(subject).to receive(:api_set).with('v.setPitch', 1.0)

        subject.pitch=370
      end
    end

    context 'throttle is not a float or int' do
      it 'raises an ArgumentError' do
        expect {
          subject.pitch='a'
        }.to raise_error ArgumentError
      end
    end

    context 'throttle is smaller than 1' do
      it 'normalizes to 0.0' do
        expect(subject).to receive(:api_set).with('v.setPitch', -1.0)

        subject.pitch = -380
      end
    end
  end

  describe '#pitch_yaw_roll_xyz' do
    it 'implements the v.setPitchYawRollXYZ call' do
      expect(subject).to receive(:api_set).with('v.setPitchYawRollXYZ', [0.5, 0.5, 0.5, 0.5, 0.5, 0.5] )

      subject.pitch_yaw_roll_xyz = { pitch:90.0, yaw:90.0, roll:90.0, x:0.5, y:0.5, z:0.5}
    end

    context 'pitch is larger than 180' do
      it 'normalizes to 1.0' do
        expect(subject).to receive(:api_set).with('v.setPitchYawRollXYZ', [1.0, 1.0, 1.0, 1.0, 1.0, 1.0])

        subject.pitch_yaw_roll_xyz = { pitch: 370, yaw: 370, roll: 370, x: 370, y: 370, z: 370 }
      end
    end

    context 'pitch is not a float or int' do
      it 'raises an ArgumentError' do
        expect {
          subject.pitch_yaw_roll_xyz = {pitch:'a', yaw:'a', roll:'a', x:'a', y:'a', z:'a'}
        }.to raise_error ArgumentError
      end
    end

    context 'pitch is smaller than 0' do
      it 'normalizes to 0.0' do
        expect(subject).to receive(:api_set).with('v.setPitchYawRollXYZ', [-0.75,-0.75,-0.75,0,0,0])

        subject.pitch_yaw_roll_xyz = {pitch:-135.0, yaw:-135.0, roll:-135.0, x:-0.4, y:-0.4, z:-0.4}
      end
    end
  end

  describe '#set_throttle' do
    it 'implements the f.setThrottle call' do
      expect(subject).to receive(:api_set).with('f.setThrottle', 0.5)

      subject.set_throttle(0.5)
    end

    context 'throttle is larger than 1' do
      it 'normalizes to 1.0' do
        expect(subject).to receive(:api_set).with('f.setThrottle', 1.0)

        subject.set_throttle(123)
      end
    end

    context 'throttle is not a float or int' do
      it 'raises an ArgumentError' do
        expect {
          subject.set_throttle('a')
        }.to raise_error ArgumentError
      end
    end

    context 'throttle is smaller than 0' do
      it 'normalizes to 0.0' do
        expect(subject).to receive(:api_set).with('f.setThrottle', 0.0)

        subject.set_throttle(-0.4)
      end
    end
  end

  describe '#stage!' do
    it 'implements the f.stage call' do
      expect(subject).to receive(:api_get).with('f.stage')

      subject.stage!
    end
  end

  describe '#throttle' do
    it 'implements the f.throttle call' do
      expect(subject).to receive(:api_get).with('f.throttle')

      subject.throttle
    end

    it 'returns a float' do
      expect(subject.throttle).to be_an_instance_of Float
    end
  end

  describe '#throttle_down' do
    it 'implements the f.throttleDown call' do
      expect(subject).to receive(:api_get).with('f.throttleDown')

      subject.throttle_down
    end
  end

  describe '#throttle_up' do
    it 'implements the f.throttleUp call' do
      expect(subject).to receive(:api_get).with('f.throttleUp')

      subject.throttle_up
    end
  end

  describe '#throttle_full' do
    it 'implements the f.throttleFull call' do
      expect(subject).to receive(:api_get).with('f.throttleFull')

      subject.throttle_full
    end
  end

  describe '#throttle_zero' do
    it 'implements the f.throttleZero call' do
      expect(subject).to receive(:api_get).with('f.throttleZero')

      subject.throttle_zero
    end
  end

  describe '#toggle_gear' do
    it 'implements the f.gear call' do
      expect(subject).to receive(:api_get).with('f.gear')

      subject.toggle_gear
    end
  end

  describe '#toggle_light' do
    it 'implements the f.light call' do
      expect(subject).to receive(:api_get).with('f.light')

      subject.toggle_light
    end
  end

  describe '#toggle_rcs' do
    it 'implements the f.rcs call' do
      expect(subject).to receive(:api_get).with('f.rcs')

      subject.toggle_rcs
    end
  end

  describe '#toggle_sas' do
    it 'implements the f.sas call' do
      expect(subject).to receive(:api_get).with('f.sas')

      subject.toggle_sas
    end
  end
end
