require 'spec_helper'

class DummyClass
end

describe Kuby::Link::FlightMethods do
  subject { DummyClass.new }

  before do
    subject.extend Kuby::Link::FlightMethods
    subject.stub(:api_get)
  end

  describe '#abort' do
    it 'implements the f.abort call' do
      subject.should_receive(:api_get).with('f.abort')

      subject.abort
    end
  end

  (1..10).each do |group_no|
    describe "#actiongroup_#{group_no}" do
      it "implements the f.ag#{group_no} call" do
        subject.should_receive(:api_get).with("f.ag#{group_no}")

        subject.send("actiongroup_#{group_no}")
      end
    end
  end

  describe '#brake' do
    it 'implements the f.brake call' do
      subject.should_receive(:api_get).with('f.brake')

      subject.brake
    end
  end

  describe '#set_throttle' do
    it 'implements the f.setThrottle call' do
      subject.should_receive(:api_set).with('f.setThrottle', 0.5)

      subject.set_throttle(0.5)
    end

    context 'throttle is larger than 1' do
      it 'normalizes to 1.0' do
        subject.should_receive(:api_set).with('f.setThrottle', 1.0)

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
        subject.should_receive(:api_set).with('f.setThrottle', 0.0)

        subject.set_throttle(-0.4)
      end
    end
  end

  describe '#stage!' do
    it 'implements the f.stage call' do
      subject.should_receive(:api_get).with('f.stage')

      subject.stage!
    end
  end

  describe '#throttle' do
    it 'implements the f.throttle call' do
      subject.should_receive(:api_get).with('f.throttle')

      subject.throttle
    end

    it 'returns a float' do
      expect(subject.throttle).to be_an_instance_of Float
    end
  end

  describe '#throttle_down' do
    it 'implements the f.throttleDown call' do
      subject.should_receive(:api_get).with('f.throttleDown')

      subject.throttle_down
    end
  end

  describe '#throttle_up' do
    it 'implements the f.throttleUp call' do
      subject.should_receive(:api_get).with('f.throttleUp')

      subject.throttle_up
    end
  end

  describe '#throttle_full' do
    it 'implements the f.throttleFull call' do
      subject.should_receive(:api_get).with('f.throttleFull')

      subject.throttle_full
    end
  end

  describe '#throttle_zero' do
    it 'implements the f.throttleZero call' do
      subject.should_receive(:api_get).with('f.throttleZero')

      subject.throttle_zero
    end
  end

  describe '#toggle_gear' do
    it 'implements the f.gear call' do
      subject.should_receive(:api_get).with('f.gear')

      subject.toggle_gear
    end
  end

  describe '#toggle_light' do
    it 'implements the f.light call' do
      subject.should_receive(:api_get).with('f.light')

      subject.toggle_light
    end
  end

  describe '#toggle_rcs' do
    it 'implements the f.rcs call' do
      subject.should_receive(:api_get).with('f.rcs')

      subject.toggle_rcs
    end
  end

  describe '#toggle_sas' do
    it 'implements the f.sas call' do
      subject.should_receive(:api_get).with('f.sas')

      subject.toggle_sas
    end
  end
end
