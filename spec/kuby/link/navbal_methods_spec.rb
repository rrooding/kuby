require 'spec_helper'

class DummyClass
end

describe Kuby::Link::NavballMethods do
  subject { DummyClass.new }

  before do
    subject.extend Kuby::Link::NavballMethods
    allow(subject).to receive(:api_get)
  end

  describe '#heading' do
    it 'implements the n.heading call' do
      expect(subject).to receive(:api_get).with('n.heading')

      subject.heading
    end

    it 'returns a float' do
      expect(subject.heading).to be_an_instance_of Float
    end
  end

  describe '#pitch' do
    it 'implements the n.pitch call' do
      expect(subject).to receive(:api_get).with('n.pitch')

      subject.pitch
    end

    it 'returns a float' do
      expect(subject.pitch).to be_an_instance_of Float
    end
  end

  describe '#roll' do
    it 'implements the n.roll call' do
      expect(subject).to receive(:api_get).with('n.roll')

      subject.roll
    end

    it 'returns a float' do
      expect(subject.roll).to be_an_instance_of Float
    end
  end
end
