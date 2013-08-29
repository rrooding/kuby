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

  describe '#brake' do
    it 'implements the f.brake call' do
      subject.should_receive(:api_get).with('f.brake')

      subject.brake
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

  describe '#stage!' do
    it 'implements the f.stage call' do
      subject.should_receive(:api_get).with('f.stage')

      subject.stage!
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
end
